{ NOTA: No sé si esta bien usar las palabras reservadas de Pascal en minúscula 
o en mayúscula, las uso como guía visual. Lo que está en minúscula está adentro
del desarrollo y lo que está en mayúscula está por fuera }

{ 10. Realizar un programa que lea palabras hasta que se ingresa fin, verifique si
 la palabras cumple con los parámetros, empieza con consonante y termina con vocal }

PROGRAM verificadorPalabras;

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

{ NOTA: Podría hacer más legible y reutilizable el código si lo desarrollo dentro
 de dos funciones }

{ 13. Escriba una función para determinar si una fecha es válida, siendo una fecha
 válida el formato dd/mm/yyyy }

{ PASOS: Primero, crear una función para identificar si el año es bisiesto o no; segundo,
 crear una función para identificar la cant. de días que tiene cada mes y corregir
 Febrero con la primer función; tercero, crear una función para identificar el formato
 dd/mm/aaaa; cuarto y último, hacer que funcione como sea }

PROGRAM verificadorFechas;

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

{ BASTA DE FUNCIONES }

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






