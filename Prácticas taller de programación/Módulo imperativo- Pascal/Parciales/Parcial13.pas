{13. Una perfumería dispone en papel de la información de las ventas de sus productos. De
cada venta conoce: código de producto, tipo de producto, fecha, cantidad de unidades vendida y
monto.
Se pide realizar un programa que:
	a) A partir de la información de ventas ingresadas por teclado, genere un ABB que almacene para
cada código de producto: su tipo, la cantidad total de unidades vendidas y el monto total vendido
(entre todas las ventas realizadas). El ABB debe ordenarse por código de producto. El ingreso de
información finaliza cuando se lee cantidad vendida 0.
b) Luego de generado el ABB, informar (implementar un módulo para cada inciso):
	i - El tipo de los productos cuyo código está comprendido entre los valores 1500 y 2200.
ii – La cantidad de productos con monto total vendido comprendido entre 10000 y 50000.}
program Parcial13;
type
	cadena=string[10];
	venta=record
		codPdto,cant:integer;
		tipo:cadena;
		monto:real;
	end;
	
	arbol=^nodoArbol;
	nodoArbol=record
		info:venta;
		HI,HD:arbol;
	end;
	
//INCISO A

procedure lectura(var datos:venta);
begin
	with datos do begin
		write('Cantidad vendida: ');
		readln(cant);
		if cant <> 0 then begin
			write('Codigo de producto ');
			readln(codPdto);
			write('Tipo ');
			readln(tipo);
			write('Monto ');
			readln(monto);
		end;
	end;
end;

procedure crearArbol(var ar:arbol; datos:venta);
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
		if datos.codPdto = ar^.info.codPdto then begin
			ar^.info.cant:=ar^.info.cant+datos.cant;
			ar^.info.monto:=ar^.info.monto+ datos.monto;
		end
		else
			if datos.codPdto< ar^.info.codPdto then
				crearArbol(ar^.HI,datos)
			else
				crearArbol(ar^.HD,datos);
end;


procedure cargarVentas(var ar:arbol);
var
	datos:venta;
begin
	lectura(datos);
	while datos.cant <> 0 do begin
		crearArbol(ar,datos);
		lectura(datos);
	end;
end;
	
//INCISO B i.
{i - El tipo de los productos cuyo código está comprendido entre los valores 1500 y 2200.}	
procedure tipoPorCodigo(ar:arbol);
begin
	if ar<> nil then begin
		if ar^.info.codPdto > 2200 then 
			tipoPorCodigo(ar^.HI)
		else
			if (ar^.info.codPdto >= 1500) and (ar^.info.codPdto <= 2200) then begin
				writeln('Tipo: ', ar^.info.tipo);
				tipoPorCodigo(ar^.HI);
				tipoPorCodigo(ar^.HD);
			end
				else
					if ar^.info.codPdto < 1500 then
						tipoPorCodigo(ar^.HD);
	end;
end;
	
//INCISO B ii.
{ii – La cantidad de productos con monto total vendido comprendido entre 10000 y 50000.}	
function cantPdtos(ar:arbol):integer;
begin
	if ar<> nil then begin
		if (ar^.info.monto >= 10000) and (ar^.info.monto <= 50000) then 
			cantPdtos:=1+ cantPdtos(ar^.HI)+ cantPdtos(ar^.HD)
		else
			cantPdtos:=cantPdtos(ar^.HI)+ cantPdtos(ar^.HD);
	end
	else
		cantPdtos:=0;
end;
	
var
	ar:arbol;
begin
	//INCISO A
	ar:=nil;
	cargarVentas(ar);
	
	//INCISO B i.
	tipoPorCodigo(ar);
	
	//INCISO B ii.
	write('Hay ', cantPdtos(ar), ' con un monto entre 10000 y 50000');
	
	


end.
