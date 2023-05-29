{ 4. Crear un array de 10 elementos, cargue dicho array con elementos entero puede
utilizar la función random(100), posteriormente solicite al usuario ingresar un
numero, si dicho número esta en el array informar la posición, sino informar
elemento no encontrado }

program imprimirPosIndicada;

type
    diezElementos = array[1..10] of Integer;

var
    arreglo: diezElementos;
    i, max: Integer;

begin
    max := 0;

    for i := 1 to length(arreglo) do
        begin
            arreglo[i] := random(100);

            if (max <= arreglo[i]) then
                max := arreglo[i];
        end;

    writeln('Los datos en el array son: ');
    for i := 1 to length(arreglo) do
        write(arreglo[i], ' ');

    writeln;
    writeln('El dato mas alto es: ', max);

end.