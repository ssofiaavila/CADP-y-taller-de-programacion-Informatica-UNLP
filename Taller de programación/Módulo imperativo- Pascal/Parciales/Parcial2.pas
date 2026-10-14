{2. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
* Implementar un programa que
	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, 
* DNI del propietario y 
valor de la expensa. La lectura finaliza cuando llega el código de identificación -1
	b. Ordene el vector, aplicando el método de inserción, para obtener el vector ordenado por código de identificación de la oficina
	c. Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho 
* código está en el vector.
En caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario, informar que el código buscado no existe}

program Parcial2;
const
	dimF=300;
type
	oficina=record
		codID,dni:integer;
		valor:real;
	end;
	
	vector=array[1..dimF]of oficina;

//INCISO A

procedure lectura(var datos:oficina);
begin
	with datos do begin
		write('Codigo de oficina: ');
		readln(codID);
		if codID <> -1 then begin
			write('DNI: ');
			readln(dni);
			write('Valor: ');
			readln(valor);
		end;
	end;
end;

procedure cargarOficinas(var vc:vector; var dimL:integer);
var
	datos:oficina;
begin
	lectura(datos);
	while datos.codID <> -1 do begin
		dimL:=dimL+1;
		vc[dimL]:=datos;
		lectura(datos);
	end;
end;

//INCISO B
procedure ordenarVector(var vc:vector; dimL:integer);
var
	i,j:integer;
	aux:oficina;
begin
	for i:=2 to dimL do begin
		aux:=vc[i];
		j:=i-1;
		while (j>0) and (vc[j].dni > aux.dni) do begin
			vc[j+1]:=vc[j];
			j:=j-1;
		end;
		vc[j+1]:=aux;
	end;
end;

//INCISO C
{c. Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho 
* código está en el vector.
En caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario, informar que el código buscado no existe}
procedure busquedaDicotomica(vc:vector; dimL:integer; var pos:integer; cod:integer);
var
	pri,ult,medio:integer;
begin
	pos:=0;
	pri:=1;
	ult:=dimL;
	medio:=(pri+ult) div 2;
	while (pri <=ult) and (cod <> vc[medio].codID) do begin
		if cod < vc[medio].codID then
			ult:=medio-1
			else
				pri:=medio;
		medio:=(pri+ult) div 2;
	end;
	if pri<= ult then
		pos:=medio
		else
			pos:=0;
end;


var
	vc:vector;
	cod,dimL,pos:integer;
begin
	//INCISO A
	dimL:=0;
	cargarOficinas(vc,dimL);
	
	//INCISO B
	ordenarVector(vc,dimL);	
	
	//INCISO C
	writeln('Codigo de oficina para buscar ');
	readln(cod);
	busquedaDicotomica(vc,dimL,pos,cod);
	if pos <> 0 then
		writeln(vc[pos].dni)
	else
		writeln('El codigo buscado no existe');
end.
