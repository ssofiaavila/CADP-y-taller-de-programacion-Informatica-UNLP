{10. Implementar un programa que contenga:
* 
	a. Un módulo que lea información de alumnos de Taller de Programación y almacene
en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
al 2000. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de
ingreso.
	b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo sea superior a 12803.
c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo este comprendido entre 2803 y 6982.}

program Practica2Ejercicio10;
const
	min=2000;
	puntoB=12803;
	inf=2803;
	sup=6982;
type
	cadena=string[10];
	alumno=record
		legajo,dni,ingreso:integer;
		nombre,apellido:cadena;
	end;
	
	arbol=^nodoArbol;
	nodoArbol=record
		info:alumno;
		HI,HD:arbol;
	end;
	
//INCISO A

procedure lectura(var datos:alumno);
begin
	with datos do begin
		write('Anio ingreso ');
		readln(ingreso);
		if ingreso <> 0 then begin
			write('Nombre ');
			readln(nombre);
			write('Apellido');
			readln(apellido);
			write('Legajo ');
			readln(legajo);
			write('DNI ');
			readln(dni);
		end;
	end;
end;

procedure crearArbol(var ar:arbol; datos:alumno);
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
		if datos.legajo < ar^.info.legajo then
			crearArbol(ar^.HI,datos)
		else
			crearArbol(ar^.HD,datos);
end;
			

procedure cargarAlumnos(var ar:arbol);
var
	datos:alumno;
begin
	lectura(datos);
	while datos.ingreso <> 0 do begin // lee alumnos hasta uno con anio de ingreso igual a 0
		if datos.ingreso >= min then
			crearArbol(ar,datos);
		lectura(datos);
	end;
end;
	
// INCISO B
{b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo sea superior a 12803.}	
	
procedure imprimirSuperiores(ar:arbol);
begin
		if ar<> nil then begin
			if ar^.info.legajo > puntoB then begin
				imprimirSuperiores(ar^.HI);
				writeln('Nombre: ', ar^.info.nombre, ' Apellido: ', ar^.info.apellido);
				imprimirSuperiores(ar^.HD);
			end
			else
				imprimirSuperiores(ar^.HD);
		end;
end;
	
//INCISO C
{c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo este comprendido entre 2803 y 6982.}

procedure imprimirAcotado(ar:arbol);
begin
	if ar <> nil then begin
		if ar^.info.legajo >= inf then begin
			if ar^.info.legajo <= sup then begin
				writeln(ar^.info.legajo);
				imprimirAcotado(ar^.HI);
				imprimirAcotado(ar^.HD);
			end
			else
				imprimirAcotado(ar^.HI);
		end
		else
			imprimirAcotado(ar^.HD);
end;	
end;	

	
	
var
	ar:arbol;
begin
	//INCISO A
	ar:=nil;
	cargarAlumnos(ar);
	
	
	//INCISO B
	imprimirSuperiores(ar);
	
	//INCISO C
	imprimirAcotado(ar);
	
end.
