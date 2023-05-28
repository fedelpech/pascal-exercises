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