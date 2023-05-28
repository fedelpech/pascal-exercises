PROGRAM verificarDivisores;

PROCEDURE mostrarDivisores(numero: Integer);
VAR
    i: Integer;
BEGIN
    writeln('Divisores de ', numero, ' entre 1 y 100:');
    for i := 1 to 100 do
    begin
        if (numero mod i = 0) then
            writeln(i);
    end;
    writeln('Proceso finalizado');

END;

{ Hasta acá el procedimiento }

VAR
    num: Integer;

BEGIN
    writeln('Ingresa un número:');
    readln(num);

    mostrarDivisores(num);

END.