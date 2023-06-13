{ REPRESENTATIVOS. 1) Escribir un programa que imprima los números de 1 a 100; pero para 
los múltiplos de 3 imprima "TIKI" en lugar del número; y para los múltiplos de 5 imprima "TAKA".
Para los múltiplos de 3 y 5 debe imprimir "TIKITAKA". Invoque la función desde un programa }

program ImprimirNumeros;

procedure ImprimirNumerosMultiplos;

var
    i: Integer;

begin
    for i := 1 to 100 do
    begin
        if (i mod 3 = 0) and (i mod 5 = 0) then
            writeln('TIKITAKA')
        else if i mod 3 = 0 then
            writeln('TIKI')
        else if i mod 5 = 0 then
            writeln('TAKA')
        else
            writeln(i);
    end;
end;

begin
    ImprimirNumerosMultiplos;
        
end.