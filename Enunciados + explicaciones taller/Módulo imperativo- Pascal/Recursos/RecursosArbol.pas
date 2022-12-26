// RECURSOS ARBOLES

//----- CREAR ARBOL -----
procedure crearArbol(var ar:arbol; datos://);
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
		if dato< ar^.info then
			crearArbol(ar^.HI,datos)
		else
			crearArbol(ar^.HD,datos);
end;


// CANTIDAD COMPRENDIDA ENTRE DOS CODIGOS
//BÚSQUEDA ACOTADA

//FUNCTION
function cantParticipantesPorCodigo(ar:arbol; num1,num2:integer):integer;
begin
	if ar<> nil then begin
		if ar^.info.codParticipante > num2 then
			cantParticipantesPorCodigo:=cantParticipantesPorCodigo(ar^.HI,num1,num2)
		else
			if (ar^.info.codParticipante >= num1) and (ar^.info.codParticipante <= num2) then 
				cantParticipantesPorCodigo:=1+ cantParticipantesPorCodigo(ar^.HI,num1,num2)+ cantParticipantesPorCodigo(ar^.HD,num1,num2)
			else
				if ar^.info.codParticipante < num1 then
					cantParticipantesPorCodigo:=cantParticipantesPorCodigo(ar^.HD,num1,num2);
	end
	else
		cantParticipantesPorCodigo:=0;
end;

//PROCEDURE 
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


procedure busquedaAcotada(ar:arbol);
begin
	if ar <> nil then begin
		if ar^.info. >= 1500 then begin
			if ar^.info. <= 2200 then begin
				writeln(ar^.info.//);
				busquedaAcotada(ar^.HI);
				busquedaAcotada(ar^.HD);
			end
			else
				busquedaAcotada(ar^.HI);
		end
		else
			busquedaAcotada(ar^.HD);
end;		
end;



//----------- BUSCAR -------------

// BUSCAR CANTIDAD DE NODOS
function cantidadNodos(ar:arbol) : integer;
begin
   if ar = nil then
      cantidadNodos:= 0
   else
      cantidadNodos:=1+cantidadNodos(ar^.HI) + cantidadNodos(ar^.HD);
end;
//BUSCAR ELEMENTO EN ARBOL
function buscar (ar:arbol; dato: integer):arbol;
begin
	if (ar=nil) then
		buscar:=nil
	else
		if (dato= ar^.dato) then 
			buscar:=a
		else
			if (dato < ar^.dato) then
				buscar:=buscar(ar^.HI ,dato)
			else
				buscar:=buscar(ar^.HD ,dato);
end;


// BUSCAR EL MAYOR MONTO ORDENADO POR MONTO
function gastoMayor(ar:arbol):arbol;
begin
	if (ar=nil) then
		gastoMayor:=nil
	else
		if (ar^.HD= nil) then 
			gastoMayor:=ar
		else
			gastoMayor:=gastoMayor(ar^.HD);
	
end;

procedure BuscarMax(arb : arbol;var max : integer; var codR : integer);
begin
  if (arb <> nil) then
    if(arb^.datos.cantidadTot >= max ) then begin
       max := arb^.datos.cantidadTot;
       codR := arb^.datos.codRubro;
       buscarMax(arb^.HI,max,codR);
    end
  else
     max := -1;
end;


// BUSCAR MINIMO 
function minimo(ar:arbol;min:integer):integer;
begin
	if ar<> nil then begin
		if ar^.nro < min then 
			min:=ar^.nro;
		minimo:=minimo(ar^.HI,min);
	end
	else
		minimo:=nil;
end;

function minimo (ar:arbol): arbol;
begin
        if a=nil then 
                minimo:=nil
	else 
	        if a^.izq = nil then 
		        minimo:=ar
        else minimo:=minimo(a^.izq)
end;


procedure BuscarMin(arb : arbol;var min : integer);
begin
  if (arb <> nil) then
    if(arb^.dato <= min ) then begin
       min:= arb^.dato;
       buscarMin(arb^.HI,min);
    end
  else
     min := -1;
end;



// -------- RECORRIDOS ---------

// RECORRIDO EN ORDEN
procedure EnOrden(a:arbol);
begin
	if (a <> nil) then begin
		enOrden (a^.HI);
 		write (a^.dato);
		enOrden (a^.HD);
	end;
end;

// RECORRIDO POST ORDEN 
procedure postorden(a:arbol);
begin
	if (a <> nil) then begin
		postorden(a^.HI);
		postorden(a^.HD);
		writeln(a^.dato);
	end;
end;

//RECORRIDO PRE ORDEN
procedure preorden(a:arbol);
begin
	if (a <> nil) then begin
 		write (a^.dato);
 		preorden(a^.HI);
 		preorden(a^.HD);
	end;
end;
