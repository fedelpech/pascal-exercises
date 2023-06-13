{ REPRESENTATIVOS. 2) Escriba un programa que solicite al usuario dos números, y 
posteriormente nos indique la cantidad de números pares que hay en el intervalo de
los números ingresados }

program dosNumeros;

function dosNumeros(i, j: Integer): Integer;
var
    cantPares: Integer;

begin
    cantPares := 0;

    for i := i + 1 to j - 1 do
    begin
        if i mod 2 = 0 then
            cantPares := cantPares + 1
        else;
    end;

    dosNumeros := cantPares;

end;

var
    i, j, pares: Integer;

begin
    repeat
        writeln('Ingresa un número');
        read(i);
        writeln('Ingresa un número mayor');
        read(j);

    until (i < j);

    pares := dosNumeros(i, j);
    writeln('La cantidad de números pares entre ', i, ' y ', j, ' son ', pares);

end.