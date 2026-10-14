{11. Implementar un programa que procese la información de los participantes a un concurso
de preguntas y respuestas. De cada participante se lee el código de participante, código de ciudad de
origen y edad. El ingreso de los participantes finaliza cuando se lee el código -1.
Implementar un programa que:
	a) Genere un ABB a partir de la información leída, ordenado por código de participante.
b) Contenga un módulo que reciba el árbol generado en a) y un código de ciudad y retorne una lista
con los participantes de esa ciudad.
c) Invoque al módulo de b) y luego muestre el contenido de la lista resultante utilizando un módulo
recursivo.
d) Muestre la cantidad de participantes cuyos códigos están comprendidos entre dos valores
determinados. Para ello implementar un módulo que reciba el árbol generado en a) y dos valores y
devuelva la cantidad pedida.
e) Informe la edad promedio de los participantes del concurso.
}
program Parcial11;
type
	participante=record
		codParticipante,codCiudad,edad:integer;
	end;
	
	arbol=^nodoArbol;
	nodoArbol=record
		info:participante;
		HI,HD:arbol;
	end;
	
//INCISO A

procedure lectura(var datos:participante);
begin
	with datos do begin
		write('Codigo de participante ');
		readln(codParticipante);
		if codParticipante <> -1 then begin
			write('Codigo de ciudad ');
			readln(codCiudad);
			write('Edad ');
			readln(edad);
		end;
	end;
end;

procedure crearArbol(var ar:arbol; datos:participante);
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
		if datos.codParticipante< ar^.info.codParticipante then
			crearArbol(ar^.HI,datos)
		else
			crearArbol(ar^.HD,datos);
end;


procedure cargarParticipantes(var ar:arbol; var cant,total:integer);
var
	datos:participante;
begin
	lectura(datos);
	while datos.codParticipante <> -1 do begin
		cant:=cant+1;
		total:=total+ datos.edad;
		crearArbol(ar,datos);
		lectura(datos);
	end;
end;
	
procedure imprimirPorCodigo(ar:arbol; cod:integer);
begin
	if ar<> nil then begin
		if ar^.info.codCiudad = cod then
			writeln(ar^.info.codParticipante);
		imprimirPorCodigo(ar^.HD,cod);
		imprimirPorCodigo(ar^.HI,cod);
	end;
end;
	
var
	ar:arbol;
	cant,total,cod:integer;
	promedio:real;
begin
	//INCISO A
	ar:=nil;
	cant:=0;
	total:=0;
	cargarParticipantes(ar,cant,total);
	
	//INCISO B
	writeln('Ingrese un codigo de ciudad ');
	readln(cod);
	imprimirPorCodigo(ar,cod);

	//INCISO C
	promedio:=total/cant;
	writeln('La edad promedio de los participantes  es ', promedio);
	
end.
