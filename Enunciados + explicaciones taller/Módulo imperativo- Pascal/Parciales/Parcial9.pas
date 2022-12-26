{9. Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra: dni, cód. de paciente, 
* obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y costo abonado por sesión. Implemente un programa que:
	a. Genere un ABB ordenado por cód. de paciente. Para ello, genere información hasta el paciente con dni 0. A partir del ABB, 
* realice módulos (uno por inciso) para:
	b) Generar una estructura con código y dni de los pacientes de osde, sabiendo que cómo máximo son 100. La estructura debe ordenarse 
* por código ascendentemente.
c) Dado un código de paciente, aumentar el costo abonado por sesión en un monto recibido. Considere que el paciente puede no existir.
NOTA: Realice el programa principal que invoque a los módulos desarrollados.
}
program Parcial9;
const
	dimF=100;
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
	
	osde=record
		codPaciente,dni:integer;
	end;
	
	vector=array[1..dimF] of osde;
	
//INCISO A

procedure lectura(var datos:paciente);
begin
	with datos do begin
		write('DNI ');
		readln(dni);
		if dni <> 0 then begin
			write('Codigo de paciente ');
			readln(codPaciente);
			writeln('Obra social ');
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
		if datos.codPaciente< ar^.info.codPaciente then
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
procedure nuevaEstructura(ar:arbol; var vc:vector;var dimL:integer);
begin
	if ar<> nil then begin
		nuevaEstructura(ar^.HI,vc,dimL);
		if ar^.info.obraSocial = 3 then begin
			dimL:=dimL+1;
			vc[dimL].dni:=ar^.info.dni;
			vc[dimL].codPaciente:=ar^.info.codPaciente;
		end;
		nuevaEstructura(ar^.HD,vc,dimL);
	end;
end;
	
	
//INCISO C
{c) Dado un código de paciente, aumentar el costo abonado por sesión en un monto recibido. Considere que el paciente puede no existir.}
function buscar(ar:arbol; dato: integer):arbol;
begin
	if (ar=nil) then
		buscar:=nil
	else
		if (dato= ar^.info.codPaciente) then 
			buscar:=ar
		else
			if (dato < ar^.info.codPaciente) then
				buscar:=buscar(ar^.HI ,dato)
			else
				buscar:=buscar(ar^.HD ,dato);
end;	
	
var
	buscado,ar:arbol;
	vc:vector;
	cod,dimL:integer;
	monto:real;
begin
	//INCISO A
	ar:=nil;
	cargarPacientes(ar);


	//INCISO B
	dimL:=0;
	nuevaEstructura(ar,vc,dimL);
	
	//INCISO C
	writeln('Codigo de paciente y monto para aumentarle la sesion ');
	readln(cod);
	readln(monto);
	buscado:= buscar(ar,cod);
	if buscado <> nil then begin
		buscado^.info.costo:=buscado^.info.costo+monto;
		writeln('Fue aumentado' );
	end
	else
		writeln('No existe ');

end.
