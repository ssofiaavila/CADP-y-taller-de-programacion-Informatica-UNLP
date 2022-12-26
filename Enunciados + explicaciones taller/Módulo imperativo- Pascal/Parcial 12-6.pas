{Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra: dni, cód. de paciente, obra social 
(1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y costo abonado por sesión. Implemente un programa que: 

	a) Genere un ABB ordenado por cód. de paciente. Para ello, genere información hasta el paciente con dni 0. 
A partir del ABB, realice módulos (uno por inciso) para:

	b) Generar una estructura con código y dni de los pacientes de osde, sabiendo que cómo máximo son 100. 
	La estructura debe ordenarse por código ascendentemente .
	c) Dado un código de paciente, aumentar el costo abonado por sesión en un monto recibido. Considere que el 
paciente puede no existir.

NOTA: Realice el programa principal que invoque a los módulos desarrollados.
}
program AvilaSofiaAgostina;
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
	
//------- INCISO A

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
			write('Costo de sesion ');
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
	if datos.dni <> 0 then begin
		crearArbol(ar,datos);
		cargarPacientes(ar);
	end;
end;
	
	
//------- INCISO B

procedure nuevaEstructura(ar:arbol; var vc:vector; var dimL:integer);
begin
	if ar<> nil then begin
		if ( ar^.info.obraSocial = 3) and (dimL<dimF )then begin
			dimL:=dimL+1;
			vc[dimL].codPaciente:=ar^.info.codPaciente;
			vc[dimL].dni:=ar^.info.dni;
		end;
		nuevaEstructura(ar^.HI,vc,dimL);
		nuevaEstructura(ar^.HD,vc,dimL);
	end;
end;
	
procedure ordenarVector(var vc:vector; dimL:integer);
var
	aux:osde;
	i,j:integer;
begin
	for i:=2 to dimL do begin
		aux:=vc[i];
		j:=i-1;
		while (j>0) and (vc[j].codPaciente > aux.codPaciente) do begin
			vc[j+1]:=vc[j];
			j:=j-1;
		end;
		vc[j+1]:=aux;
	end;
end;
	
//-------- INCISO C
	
procedure aumentarMonto(var ar:arbol; cod:integer; monto:real; var encontrado:boolean);
begin
	if (ar <> nil) and (not encontrado) then begin
		if ar^.info.codPaciente = cod then begin
			ar^.info.costo:= ar^.info.costo + monto;
			encontrado:=true;
		end
		else
			aumentarMonto(ar^.HI,cod,monto,encontrado);
			aumentarMonto(ar^.HD,cod,monto,encontrado);
	end
end;
	
	
var
	ar:arbol;
	vc:vector;
	dimL,codPaciente:integer;
	monto:real;
	encontrado:boolean;
begin
	//INCISO A
	ar:=nil;
	cargarPacientes(ar);
	
	//INCISO B
	dimL:=0;
	nuevaEstructura(ar,vc,dimL);
	ordenarVector(vc,dimL);
	
	
	//INCISO C
	encontrado:=false;
	write('Codigo de paciente para aumentarle costo ');
	readln(codPaciente);
	write('Nuevo monto ');
	readln(monto);
	aumentarMonto(ar,codPaciente,monto,encontrado);

end.
