{ 2. Realizar un programa que lea 10 elementos de consola los guarde en un array y
luego los imprima }

program imprimirDiez;

type
    diezElementos = array[1..10] of String;

var
    arreglo: diezElementos;
    i: Integer;

begin
    for i := 1 to length(arreglo) do
        begin
            writeln('Ingresa el valor numero ', i, ': ');
            readln(arreglo[i]);
        end;
    
    writeln('Los datos en el array son: ');
    for i := 1 to length(arreglo) do
        write(arreglo[i], ' ');
    
end.