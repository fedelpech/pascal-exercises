{ 1. Imprimir la tercera posición de un array con cuatro elementos }

program terceraPos;

type
    cuatroElementos = array[1..4] of Integer;

var
    arreglo: cuatroElementos;
    i: Integer;
    
begin
    arreglo[3] := 2003;

    for i := 1 to length(arreglo) do
        writeln(arreglo[i]);
    
end.