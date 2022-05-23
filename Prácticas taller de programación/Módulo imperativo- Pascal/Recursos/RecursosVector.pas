//RECURSOS VECTOR


// ORDENAR POR INSERCION
procedure ordenarPorInsercion(var vc:vector; dimL:integer);
var
	i,j:integer;
	aux:dato;
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


// -------------- BUSQUEDAS -------

//BUSQUEDA EN VECTOR SIN ORDEN
procedure buscarVCSinOrden(vc:vector);
var
	pos:integer;
begin
	while pos<=dimL and not exito do begin
		if x=vc[pos] then
			exito:=true
			else
			pos:=pos+1;
		end;
	if exito=false then pos:=0;
end;



//BUSQUEDA DICOTOMICA
procedure busquedaDicotomica(vc:vector; dimL:integer; var pos:integer; cod:integer);
var
	pri,ult,medio:integer;
begin
	pos:=0;
	pri:=1;
	ult:=dimL;
	medio:=(pri+ult) div 2;
	while (pri <=ult) and (cod <> vc[medio]) do begin
		if x < vc[medio] then
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

//BUSQUEDA DICOTOMICA EN FUNCION
function BuscarElementoVO(vc: vector; dimL: integer; x: integer): integer;
var  
  pri,ult,medio,pos:integer;
begin  
  pri:=1;  
  ult:=diml;  
  medio:=(pri+ult)div 2;  
  while(pri<=ult)and(vc[medio].dni <> x)do begin
		if(x < vc[medio].dni) then  
         ult:=medio-1   
		else
			pri:=medio+1;   
		medio:=(pri+ult)div 2;   
  end;  
  if(pri<=ult) then 
	pos:= medio
  else 
    pos:=0;
  BuscarElementoVO:= pos;
end;


// -------- MODIFICAR VECTOR ------
//INSERTAR ELEMENTO EN POSICION
var
	i:integer;
begin
	if (dimL < dimF) and ((pos >=1) and (pos<= dimL)) then begin
		for i:=dimL downto pos do begin
			vc[i+1]:=v[i]
			vc[pos]:=elemento;
			dimL:=dimL+1;
		end;
	end;
end;
