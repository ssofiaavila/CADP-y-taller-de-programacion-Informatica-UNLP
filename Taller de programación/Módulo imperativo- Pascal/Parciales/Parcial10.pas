{10. Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra: dni, cód. de paciente, obra social
*  (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y costo abonado
por sesión. Implemente un programa que:
	a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con dni 0. A partir del ABB, realice módulos 
* (uno por inciso) para:
	b) Generar una estructura con dni y cód. de paciente de los pacientes de ioma, ordenados por dni descendente.
c) Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el
paciente puede no existir.
NOTA: Realice el programa principal que invoque a los módulos desarrollados.}

program Parcial10;
type
	paciente=record
		dni,codPaciente:integer;
		obraSocial:1..5;
		costo:real;
	end;
	
	arbol=^nodoArbol;
	nodoArbol=record
		info:paciente;
		HI,HD:arbol;
	end;

	lista=^nodoLista;
	nodoLista=record
		dni,cod:integer;
		sig:lista;
	end;
	

//INCISO A

procedure lectura(var datos:paciente);
begin
	with datos do begin
		write('DNI ');
		readln(dni);
		if dni <> 0 then begin
			write('Codigo de paciente ');
			readln(codPaciente);
			write('Obra social ');
			readln(obraSocial);
			write('Monto ');
			readln(costo);
		end;
	end;
end;

procedure crearArbol(var ar:arbol; datos:paciente);
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
		if datos.dni< ar^.info.dni then
			crearArbol(ar^.HI,datos)
		else
			crearArbol(ar^.HD,datos);
end;



procedure cargarPacientes(var ar:arbol);
var
	datos:paciente;
begin
	lectura(datos);
	while datos.dni <> 0 do begin
		crearArbol(ar,datos);
		lectura(datos);
	end;
end;


//INCISO B
{b) Generar una estructura con dni y cód. de paciente de los pacientes de ioma, ordenados por dni descendente.}

procedure agregarAdelante(var l:lista; datos:paciente);
var
	nue:lista;
begin
	new(nue);
	nue^.cod:=datos.codPaciente;
	nue^.dni:=datos.dni;
	nue^.sig:=l;
	l:=nue;
end;

	
procedure nuevaEstructura(ar:arbol; var l:lista);
begin
	if ar<> nil then begin
		nuevaEstructura(ar^.HI,l);
		if ar^.info.obraSocial = 1 then 
			agregarAdelante(l,ar^.info);
		nuevaEstructura(ar^.HD,l);
	end;
end;
	
//INCISO C
{c) Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el
paciente puede no existir.}	
	
function buscarPaciente(ar:arbol; dni: integer):arbol;
begin
	if (ar=nil) then
		buscarPaciente:=nil
	else
		if (dni= ar^.info.dni) then 
			buscarPaciente:=ar
		else
			if (dni < ar^.info.dni) then
				buscarPaciente:=buscarPaciente(ar^.HI ,dni)
			else
				buscarPaciente:=buscarPaciente(ar^.HD ,dni);
end;	
	
	
var
	buscado,ar:arbol;
	l:lista;
	otraObra,dni:integer;
begin
	//INCISO A
	ar:=nil;
	cargarPacientes(ar);
	
	//INCISO B
	nuevaEstructura(ar,l);
	
	//INCISO C
	writeln('Ingrese dni y obra social para modificarsela ');
	readln(dni);
	readln(otraObra);
	buscado:=buscarPaciente(ar,dni);
	if buscado <> nil then begin
		buscado^.info.obraSocial:=otraObra;
		writeln('Fue modificado ');
	end
	else
		writeln('No exise ');
end.
