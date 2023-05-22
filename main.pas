{ NOTA: No sé si esta bien usar las palabras reservadas de Pascal en minúscula 
o en mayúscula, las uso como guía visual }

{ 10. Realizar un programa que lea palabras hasta que se ingresa "fin", verifique si 
las palabras cumplen con los parámetros: empieza con consonante y termina con vocal }

PROGRAM verificarPalabras;

VAR
    palabra: String;

BEGIN
    writeln('Ingresa palabras. Ingresa "fin" para finalizar');

    repeat
        readln(palabra);

        if (palabra <> 'fin') then
        begin
            if (length(palabra) > 0) then
            begin
                if (palabra[1] in ['b'..'d', 'f'..'h', 'j'..'n', 'p'..'t', 'v'..'z']) and
                   (palabra[length(palabra)] in ['a', 'e', 'i', 'o', 'u']) then
                    writeln('La palabra es válida')
                else
                    writeln('La palabra es inválida');
            end;
        end;
    until (palabra = 'fin');
END.

{ NOTA: Podría hacer reutilizable el código si lo desarrollo dentro
de dos funciones }

{ 13. Escriba una función para determinar si una fecha es válida, siendo una fecha
válida el formato dd/mm/yyyy }

{ PASOS: Primero, crear una función para identificar si el año es bisiesto o no; segundo,
crear una función para identificar la cant. de días que tiene cada mes y corregir
Febrero con la primer función; tercero, crear una función para identificar el formato
dd/mm/aaaa }

PROGRAM verificarFechas;

FUNCTION esBisiesto(anio: Integer): Boolean;
BEGIN
    esBisiesto := ((anio mod 4 = 0) and (anio mod 100 <> 0)) or (anio mod 400 = 0);
end;

FUNCTION validarDia(dia, mes, anio: Integer): Boolean;
BEGIN
    case mes of
        01, 03, 05, 07, 08, 10, 12:
            validarDia := (dia >= 1) and (dia <= 31);
        04, 06, 09, 11:
            validarDia := (dia >= 1) and (dia <= 30);
        02:
        begin
            if esBisiesto(anio) then
                validarDia := (dia >= 1) and (dia <= 29)
            else
                validarDia := (dia >= 1) and (dia <= 28);
        end;
    end;
end;

FUNCTION validarFecha(fecha: string): Boolean;

VAR
    dia, mes, anio: Integer;
        
BEGIN
    validarFecha := False;

    if length(fecha) <> 10 then
        validarFecha := False
    else if (fecha[3] <> '/') or (fecha[6] <> '/') then
        validarFecha := False
    else
        begin
            val(fecha[1] + fecha[2], dia);
            val(fecha[4] + fecha[5], mes);
            val(fecha[7] + fecha[8] + fecha[9] + fecha[10], anio);

            if (dia < 1) or (dia > 31) or (mes < 1) or (mes > 12) or (anio < 1000) or (anio > 2023) then
                validarFecha := False
            else
                validarFecha := validarDia(dia, mes, anio);
        end;
end;

{ Hasta acá las funciones }

VAR
    fecha: string;
    fechaValida: Boolean;

BEGIN
    fechaValida := False;

    while not fechaValida do
    begin
        writeln('Ingresa una fecha con el formato dd/mm/aaaa:');
        readln(fecha);

        fechaValida := validarFecha(fecha);

        if not fechaValida then
            writeln('Fecha inválida');
    end;

    writeln('Fecha válida: ', fecha);

END.

{ 17. Escriba un procedimiento en Pascal que muestre los divisores de un
número x recibido como parámetro }

{ NOTA: Entendí la consigna como escribir un procedimiento en Pascal que 
muestre los divisores de un número x recibido como parámetro en el número
1 y 100, como para fijar un principio y un final }

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

{ NOTA 1: No sé cómo hacer para que se pueda ingresar únicamente un número entero
y no tire error si meto una letra }