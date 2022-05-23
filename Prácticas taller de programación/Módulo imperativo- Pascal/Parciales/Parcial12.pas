{12. Una familia de 4 integrantes llevan registro de sus gastos (tipo de gasto y monto
gastado). Se pide:
	a) Generar una estructura que almacene los gastos de los integrantes de la familia, agrupados según
el integrante. Por cada integrante, se leen gastos hasta tipo de gasto ‘zzz’. Los gastos de cada
integrante deben ordenarse por tipo de gasto.
	b) Imprimir la estructura generada en a.
	c) A partir de la estructura generada en a, realice un merge para obtener los montos totales gastados
por cada tipo de gasto. Genere un ABB con monto total y tipo de gasto, ordenado por monto total.
d) A partir del ABB, busque e imprima el tipo de gasto con mayor monto total.

}
program Parcial12;
const
	max=4;
type
	cadena=string[10];
	gasto=record
		tipo:cadena;
		monto:real;
	end;
	
	lista=^nodoLista;
	nodoLista=record
		info:gasto;
		sig:lista;
	end;
	
	vector=array[1..max] of lista;
	
	arbol=^nodoArbol;
	nodoArbol=record
		info:gasto;
		HI,HD:arbol;
	end;
	
//INCISO A
procedure inicializar(var vc:vector);
var
	i:integer;
begin
	for i:=1 to max do 
		vc[i]:=nil;
end;
	
procedure lectura(var datos:gasto);
begin
	with datos do begin
		writeln('Tipo de gasto ');
		readln(tipo);
		if tipo<> 'zzz' then begin
			writeln('Monto ');
			readln(monto);
		end;
	end;
end;

procedure insertarOrdenado(var l:lista; datos:gasto);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.info:=datos;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.info.tipo < datos.tipo) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if act=ant then begin
		nue^.sig :=l;
		l:=nue;
		end
		else
			begin
			ant^.sig:=nue;
			nue^.sig:=act;
			end;
end;
	
	
procedure cargarGastos(var vc:vector);
var
	i:integer;
	datos:gasto;
begin
	for i:=1 to max do begin
		writeln('Se leeran los datos del miembro', i);
		lectura(datos);
		while datos.tipo <> 'zzz' do begin
			insertarOrdenado(vc[i],datos);
			lectura(datos);
		end;
	end;
end;
	
//INCISO B
procedure imprimirListas(vc:vector);
var
	i:integer;
begin
	for i:=1 to max do begin
		while vc[i] <> nil do begin
			writeln(vc[i]^.info.tipo, ' ', vc[i]^.info.monto:1:1);
			vc[i]:=vc[i]^.sig;
		end;
	end;
end;
	
//INCISO C


procedure minimo(var vc:vector; var tipo:cadena; var monto:real);
var
	i,indiceMin:integer;
begin
	indiceMin:=-1;
	tipo:='zzz';
	for i:=1 to max do begin
		if vc[i]<> nil then begin
			if vc[i]^.info.tipo < tipo then begin
				tipo:=vc[i]^.info.tipo;
				monto:=vc[i]^.info.monto;
				indiceMin:=i;
			end;
		end;
	end;
	if indiceMin <> -1 then
		vc[indiceMin]:=vc[indiceMin]^.sig;
end;

procedure crearArbol(var ar:arbol; tipo:cadena;total:real);
var
	nue:arbol;
begin
	if ar=nil then begin
		new(nue);
		nue^.info.tipo:=tipo;
		nue^.info.monto:=total;
		nue^.HI:=nil;
		nue^.HD:=nil;
		ar:=nue;
		end
	else
		if tipo < ar^.info.tipo then
			crearArbol(ar^.HI,tipo,total)
		else
			crearArbol(ar^.HD,tipo,total);
end;

procedure merge(vc:vector; var ar:arbol);
var
	tipoAux,tipoAct:cadena;
	montoAux,total:real;
begin
	minimo(vc,tipoAux,montoAux);
	while tipoAux <>  'zzz' do begin
		tipoAct:=tipoAux;
		total:=0;
		while (tipoAux <> 'zzz') and (tipoAux = tipoAct) do begin
			total:=total+montoAux;
			minimo(vc,tipoAux,montoAux);
		end;
		crearArbol(ar,tipoAux,montoAux);
	end;
end;
	
//INCISO D
{d) A partir del ABB, busque e imprima el tipo de gasto con mayor monto total.}	
function mayorGasto(ar:arbol):arbol;
begin 
	if ar= nil then 
		mayorGasto:=nil
	else
		if ar^.HD = nil then
			mayorGasto:=ar
		else
			mayorGasto:=mayorGasto(ar^.HD);
end;

	
	
var
	vc:vector;
	mayor,ar:arbol;
begin
	//INCISO A
	inicializar(vc);
	cargarGastos(vc);
	
	//INCISO B
	imprimirListas(vc);
	
	//INCISO C
	ar:=nil;
	merge(vc,ar);
	
	//INCISO D
	mayor:=mayorGasto(ar);
	writeln('El tipo de gasto con mayor gasto es ', mayor^.info.tipo);
end.
