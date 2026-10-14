{-3. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta
	a. Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener 
* patente, año de fabricación
(2010..2018), marca y modelo
	b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la cantidad de autos de dicha marca que posee 
	* la agencia. 
* Mostrar resultado
	c. Contenta un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de
*  fabricación
d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. 
* Mostrar el resultado}

program Parcial3;
type
	cadena=string[15];
	auto=record
		marca,modelo,patente:cadena;
		anio:2010..2018;
	end;
	arbol=^nodoArbol;
	nodoArbol=record
		info:auto;
		HI,HD:arbol;
	end;
	
	lista=^nodoLista;
	nodoLista=record
		info:auto;
		sig:lista;
	end;
	vector=array[2010..2018]of lista;
	
//INCISO A

procedure lectura(var datos:auto);
begin
	with datos do begin
		writeln('Patente ');
		readln(patente);
		if patente <> 'zzz' then begin
			write('Marca ');
			readln(marca);
			write('Modelo ');
			readln(modelo);
			write('Anio ');
			readln(anio);
		end;
	end;
end;

procedure crearArbol(var ar:arbol; datos:auto);
var
	nue:arbol;
begin
	if ar=nil then begin
		new(nue);
		nue^.info:=datos;
		nue^.HI:=nil;
		nue^.HD:=nil;
		ar:=nue;
		end
	else
		if datos.patente< ar^.info.patente then
			crearArbol(ar^.HI,datos)
		else
			crearArbol(ar^.HD,datos);
end;

procedure cargarAutos(var ar:arbol);
var
	datos:auto;
begin
	writeln('Lee hasta auto con patente igual a zzz ');
	lectura(datos);
	while datos.patente <> 'zzz' do begin
		crearArbol(ar,datos);
		lectura(datos);
	end;
end;
	
//INCISO B
{b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la cantidad de autos de dicha marca que posee la agencia. 
* Mostrar resultado}

function cantAutosPorMarca(ar:arbol; marca:cadena):integer;
begin
	if ar= nil then 
		cantAutosPorMarca:=0
	else
		begin
			if ar^.info.marca = marca then
				cantAutosPorMarca:=1+ cantAutosPorMarca(ar^.HI,marca)+ cantAutosPorMarca(ar^.HD,marca)
			else
				cantAutosPorMarca:=cantAutosPorMarca(ar^.HI,marca)+cantAutosPorMarca(ar^.HD,marca);
		end;
end;

//INCISO C
procedure inicializar(var vc:vector);
var
	i:integer;
begin
	for i:=2010 to 2018 do 
		vc[i]:=nil;
end;

procedure agregarALista(var l:lista; datos:auto);
var
	nue:lista;
begin
	new(nue);
	nue^.info:=datos;
	nue^.sig:=l;
	l:=nue;
end;

procedure nuevaEstructura(ar:arbol; var vc:vector);
begin
	if ar<> nil then begin
		agregarALista(vc[ar^.info.anio],ar^.info);
		nuevaEstructura(ar^.HI,vc);
		nuevaEstructura(ar^.HD,vc);
	end;
end;

//INCISO D
{d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. 
* Mostrar el resultado}

function buscarPorPatente(ar:arbol; patente: cadena):arbol;
begin
	if (ar=nil) then
		buscarPorPatente:=nil
	else
		if (patente= ar^.info.patente) then 
			buscarPorPatente:=ar
		else
			if (patente < ar^.info.patente) then
				buscarPorPatente:=buscarPorPatente(ar^.HI ,patente)
			else
				buscarPorPatente:=buscarPorPatente(ar^.HD ,patente);
end;


var
	buscado,ar:arbol;
	patente,marca:cadena;
	vc:vector; 
begin
	//INCISO A
	ar:=nil;
	cargarAutos(ar);	
	
	//INCISO B
	write('Marca para buscar cantidad de autos ');
	readln(marca);
	writeln('Para la marca ', marca, ' hay ', cantAutosPorMarca(ar,marca), ' autos' );
	
	//INCISO C
	inicializar(vc);
	nuevaEstructura(ar,vc);
	
	//INCISO D
	write('Patente para buscar anio de auto ');
	readln(patente);
	buscado:=buscarPorPatente(ar,patente);
	write('El auto con patente ', patente, ' fue fabricado en ', buscado^.info.anio);
	
	
end.


