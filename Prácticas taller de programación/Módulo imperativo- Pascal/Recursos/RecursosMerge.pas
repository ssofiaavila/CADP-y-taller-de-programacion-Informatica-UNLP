// MERGE 
{MERGE ACUMULADOR}
procedure merge(todos:estantesl var Enuevo:lista)
var
	ult://;
	montoTotal,monto,minX,actual://;

begin
	ult:=nil;
	minimo(//,minX,monto);
	while minX <> // do begin
		actual:=minX;
		montoTotal:=0;
		while ((minX <> //) and (minX = actual) do begin
			montoTotal:=montoTotal+monto;
			minimo(vc,minX,monto);
		end;
		agregarAtras(//,//,actual,montoTotal);
	end;
end;


{PROCEDURE MINIMO}
procedure minimo(//; var minX://; var monto:real);
var
	indiceMin,i:integer;
begin
	minX:="ZZZ";
	indiceMin:=-1;
	for i:=1 to // do begin
		if vc[i]<> nil then begin
			if vc[i]^/// <= minX then begin
				indiceMin:=i;
				minX:=vc[i]^..;
				monto:=vc[i]^..;
			end;
		end;
	end;
	if indiceMin <> -1 then
		vc[indiceMin]:=vc[indiceMin]^.sig;
end;	
	//siempre me conviene enganchar los datos en el en if indiceMin para optimizar tiempo
	
	
//----------MERGE COMÚN ---------------
//MERGE COMUN
procedure merge(vc:vector; var l2:listaNue);
var
	datos:venta;
	ult:listaNue;
begin
	ult:=nil;
	minimo(vc,datos);
	while datos.codVenta<> corte do begin
		insertarAtras(l2,ult,datos);
		minimo(vc,datos);
	end;
end;

procedure minimo(var vc:vector; var datos:venta);
var
	i,indiceMin:integer;
begin
	datos.codVenta:=corte;
	indiceMin:=-1;
	for i:=1 to dimF do begin
		if vc[i] <> nil then begin
			if vc[i]^.info.codVenta < datos.codVenta then begin
				indiceMin:=i;
				datos.codVenta:=vc[i]^.info.codVenta;				
			end;
		end;
	end;
	if indiceMin <> -1 then begin
		datos.codPdto:= vc[indiceMin]^.info.codPdto;
		datos.cant:= vc[indiceMin]^.info.cant;
		vc[indiceMin]:=vc[indiceMin]^.sig;
	end;
end;
