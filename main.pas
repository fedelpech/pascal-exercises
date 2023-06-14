{ REPRESENTATIVO. 4) Escriba un programa que lea palabras hasta que se ingrese “fin”, 
al finalizar debe informar lo siguiente:
a) Cantidad de palabras ingresadas.
b) Cantidad de palabras con cantidad de letras par.
c) Cantidad de letras impar.
d) Cantidad de veces que ingreso la palabra “hola” }

program imprimirFin;

var
    cantPalabras, letrasPar, letrasImpar, cantHola: Integer;
    fin, palabra: String;

begin
    cantPalabras := 0;
    letrasPar := 0;
    letrasImpar := 0;
    cantHola := 0;

    repeat
        writeln('Ingresa una palabra');
        readln(palabra);

        cantPalabras := cantPalabras + 1;

        if palabra = 'fin' then
            fin := palabra
        else
        begin
            if length(palabra) mod 2 = 0 then
                begin
                    letrasPar := letrasPar + 1;
                    if palabra = 'hola' then
                        cantHola := cantHola + 1;
                end
            else
                letrasImpar := letrasImpar + 1;
        end;

    until fin = 'fin';

    writeln('Cantidad de palabras ingresadas: ', cantPalabras - 1);
    writeln('Cantidad de palabras pares: ', letrasPar);
    writeln('Cantidad de palabras impares: ', letrasImpar);
    writeln('Cantidad de Hola: ', cantHola);

end.