{8. Escribir un programa que:
	a. Implemente un módulo que lea números enteros y los almacene en un árbol
binario de búsqueda. La lectura finaliza con el valor 0.
b. Una vez generado el árbol, realice módulos independientes para:
	i. Obtener el número más grande.
	ii. Obtener el número más chico.
	iii. Obtener la cantidad de elementos.
	iv. Informar los números en orden creciente.
	v. Informar los números pares en orden decreciente.
Nota: Tener en cuenta que cada número debe aparecer una única vez en el árbol.}
program Practica2Ejercicio8;
type
	arbol=^nodoArbol;
	nodoArbol=record
		num:integer;
		HI,HD:arbol;
	end;
	
//INCISO A

procedure crearArbol(var ar:arbol; nro:integer);
var
	nue:arbol;
begin
	if ar=nil then begin
		new(nue);
		nue^.num:=nro;
		nue^.HI:=nil;
		nue^.HD:=nil;
		ar:=nue;
		end
	else
		if nro< ar^.num then
			crearArbol(ar^.HI,nro)
		else
			crearArbol(ar^.HD,nro);
end;

procedure cargarNumeros(var ar:arbol);
var
	nro:integer;
begin
	write('Ingrese numeros hasta ingresar 0 ');
	readln(nro);
	while nro <> 0 do begin
		crearArbol(ar,nro);
		write('Otro numero ');
		readln(nro);
	end;
end;
	
// INCISO B i.
function nroMaximo(ar:arbol):arbol;
begin
		if ar<> nil then begin
			if ar^.HD = nil then
				nroMaximo:=ar
			else
				nroMaximo:=nroMaximo(ar^.HD);
		end
		else
			nroMaximo:=nil;
end;
	
	
// B ii.
function nroMinimo(ar:arbol):arbol;
begin
		if ar<> nil then begin
			if ar^.HI = nil then 
				nroMinimo:=ar
			else
				nroMinimo:=nroMinimo(ar^.HI);
		end
		else
			nroMinimo:=nil;
end;

// B iii.
function cantNodos(ar:arbol) : integer;
begin
   if ar = nil then
      cantNodos:= 0
   else
      cantNodos:=1+cantNodos(ar^.HI) + cantNodos(ar^.HD);
end;


procedure enOrden(a:arbol);
begin
	if (a <> nil) then begin
		enOrden (a^.HI);
 		write (a^.num);
		enOrden (a^.HD);
	end;
end;


// B v.

procedure imprimirDecendente(ar:arbol);
begin
	if ar<> nil then begin
		imprimirDecendente(ar^.HD);
		if ar^.num mod 2 = 0 then 
			writeln(ar^.num);
		imprimirDecendente(ar^.HI);
	end;
end;

var
	maximo,ar,minimo:arbol;
begin
	//INCISO A
	ar:=nil;
	cargarNumeros(ar);
	
	//INCISO B i.
	maximo:=nroMaximo(ar);
	writeln('El numero mas grande es ', maximo^.num);
	//B ii.
	minimo:=nroMinimo(ar);
	writeln('El numero mas chico es ', minimo^.num);

	//B iii.
	write('En el arbol hay ', cantNodos(ar), ' de nodos ');
	
	// B iv.
	enOrden(ar);
	
	//B v.
	imprimirDecendente(ar);

end.
