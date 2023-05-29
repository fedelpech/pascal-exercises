{ 3. Crea un programa que reserve espacio para un Array de 3 números enteros, que
asigne a sus elementos los valores 3, 5 y 8, y que después muestre en pantalla la
suma de los valores de sus 3 elementos }

program sumarElementos;

var
    arreglo: array[1..3] of Integer;
    i, suma: Integer;
    
begin
    arreglo[1] := 3;
    arreglo[2] := 5;
    arreglo[3] := 8;

    suma := 0;

    for i := 1 to length(arreglo) do
        suma := suma + arreglo[i];

    writeln('La suma de los elementos del arreglo da ', suma);
end.