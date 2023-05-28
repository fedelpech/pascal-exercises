PROGRAM verificarFechas;

FUNCTION esBisiesto(anio: Integer): Boolean;
BEGIN
    esBisiesto := ((anio mod 4 = 0) and (anio mod 100 <> 0)) or (anio mod 400 = 0);
end;

FUNCTION validarDia(dia, mes: Integer): Boolean;
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
    writeln('Proceso finalizado');

END.