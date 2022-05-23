{1. Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. Se desea procesar 
la información de una semana. Se pide:
	a. Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (1..7), código de la obra, asiento, monto. 
La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente
	b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de 
obra de forma ascendente
c. Realice un módulo recursivo que informe el contenido de la lista generada en b)}
program Parcial1;
const
	dias=7;
type
	entrada=record
		dia:1..dias;
		codObra,asiento:integer;
		monto:real;
	end;
	
	lista=^nodoLista;
	nodoLista=record
		info:entrada;
		sig:lista;
	end;
	
	vector=array[1..dias] of lista;
	
	listaNue=^nodoNue;
	nodoNue=record
		codObra,total:integer;
		sig:listaNue;
	end;

//INCISO A
procedure inicializar(var vc:vector);
var
	i:integer;
begin
	for i:=1 to dias do 
		vc[i]:=nil;
end;
	
procedure lectura(var datos:entrada);
begin
	with datos do begin
		write('Codigo de obra: ');
		readln(codObra);
		if codObra <> 0 then begin
			write('Asiento ');
			readln(asiento);
			write('Dia: ');
			readln(dia);
			write('Monto: ');
			readln(monto);
		end;
	end;
end;

procedure insertarOrdenado(var l:lista; datos:entrada);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.info:=datos;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.info.codObra < datos.codObra) do begin
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

	
procedure cargarVentas(var vc:vector);
var
	datos:entrada;
begin
	lectura(datos);
	while datos.codObra <> 0 do begin
		insertarOrdenado(vc[datos.dia],datos);
		lectura(datos);
	end;
end;

// INCISO B

procedure minimo(var vc:vector; var cod:integer);
var
	i,indiceMin:integer;
begin
	cod:=9999;
	indiceMin:=-1;
	for i:=1 to dias do begin
		if vc[i]<> nil then begin
			if vc[i]^.info.codObra < cod then begin
				cod:=vc[i]^.info.codObra;
				indiceMin:=i;
			end;
		end;
	end;
	if indiceMin <> -1 then
		vc[indiceMin]:= vc[indiceMin]^.sig;
end;


procedure agregarAtras(var l,ult:listaNue; cod,total:integer);
var
	nue:listaNue;
begin
	new(nue);
	nue^.codObra:=cod;
	nue^.total:=total;
	nue^.sig:=nil;
	if (l=nil) then
		l:= nue
	else
		ult^.sig := nue;
	ult := nue;
end;

procedure nuevaEstructura(vc:vector; var l:listaNue);
var
	ult:listaNue;
	codAct,codAux,total:integer;
begin
	ult:=nil;
	minimo(vc,codAux);
	while codAux <> 9999 do begin
		codAct:=codAux;
		total:=0;
		while (codAux=codAct) and (codAux <> 9999) do begin
			total:=total+1;
			minimo(vc,codAux);
		end;
		agregarAtras(l,ult,codAct,total)
	end;
end;
	
//INCISO C
procedure imprimirLista(l:listaNue);
begin
	if l<> nil then begin
		writeln('Codigo de obra: ', l^.codObra, ' Total: ', l^.total);
		imprimirLista(l^.sig);
	end;
end;
	
var
	vc:vector;
	l2:listaNue;
begin
	//INCISO A
	inicializar(vc);
	cargarVentas(vc);

	//INCISO B
	l2:=nil;
	nuevaEstructura(vc,l2);
	
	//INCISO C
	imprimirLista(l2);

end.
