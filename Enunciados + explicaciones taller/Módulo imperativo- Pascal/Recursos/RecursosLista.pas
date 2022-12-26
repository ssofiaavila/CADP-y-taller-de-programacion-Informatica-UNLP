//RECURSOS PASCAL

//-------------- AGREGAR ELEMENTOS EN LISTA -------------

//INSERTAR ADELANTE
procedure agregarAdelante(var l:lista; dato://);
var
	nue:lista;
begin
	new(nue);
	nue^.info:=//;
	nue^.sig:=l;
	l:=nue;
end;


//INSERTAR ATRAS
procedure agregarAtras(var l,ult:lista; dato://);
var
	nue:lista;
begin
	new(nue);
	nue^.///;
	nue^.sig:=nil;
	if (l=nil) then
		l:= nue
	else
		ult^.sig := nue;
	ult := nue;
end;

//INSERTAR ORDENADO ASCENDENTEMENTE
procedure insertarOrdenado(var l:lista; datos://);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.//:=//;
	act:=l;
	ant:=l;
	while (act<>nil) and (act^.// < //) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if act=ant then begin
		nue^.sig :=l;
		l:=nue;
		end
		else
			begin
			ant^.sig:=nue;
			nue^.sig:=act;
			end;
end;




//---------------- ACCIONES LISTA --------------

//ELIMINAR ELEMENTO DE LISTA
procedure eliminarElemento(var l:lista);
var
	act,ant:lista;
	exito:boolean;
begin
	exito:=false;
	ant:=l;
	act:=l;
	while (act<> nil) and (act^.// <> //) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if act<>nil then begin
		exito:=true;
		if act:=l then
			l:=act^.sig
			else
				ant^.sig:=act^.sig;
	dispose(act);
end;
	

//------ IMPRIMIR --------
//IMPRIMIR ORDEN INVERSO RECURSIVO
procedure ImprimirOrdenInverso(l: lista); //RECURSIVO
begin
	if ( l<> nil) then begin
		ImprimirOrdenInverso(l^.sig);
		write ( l^.dato, ' ');  
	end;
end;



// --------- BUSCAR ELEMENTO ----------

// SABER SI EXISTE UN ELEMENTO EN LISTA
function buscar(l:lista; num:integer):boolean;
begin
	if l<> nil then begin
		if l^.nro = num then
			buscar:=true
		else
			buscar(l^.sig,num)
	end
	else
		buscar:=false;
end;

procedure buscar(l:lista; x://);
var
	encontre:boolean;
begin
	encontre:=false;
	while (l<>nil) and (not encontre) do begin
		if x=l^.?? then
			encontre:=true
			else
			l:=l^.sig;
	end;
end;




// BUSCAR MAXIMO EN LISTA
function maximoPdto(l:listaPdtos; max,codMax: integer):integer;
begin
	if l<> nil then begin
		if l^.info.total > max then begin
			max:=l^.info.total;
			codMax:=l^.info.codPdto;
		end;
		maximoPdto:=maximoPdto(l^.sig,max,codMax);
	end
	else
		maximoPdto:=codMax;

end;
