function [y, converge]=convergenciaCriterioDeSassenfeld(matriz, tamanho)
    format long g;
    [alpha, convercaoLinhas] = convergenciaCriterioDasLinhas(matriz, tamanho);
    if convercaoLinhas == true
        multiplicacao = 0;
        betha = ones(tamanho);
        betha(1) = alpha(1);
        for index = 1:tamanho
            multiplicacao = 0;
            for index2 = 1:tamanho
                if index ~= index2
                    multiplicacao = multiplicacao + betha(index2)*abs(matriz(index, index2));
                end
            end
            betha(index) = multiplicacao/abs(matriz(index, index));
            fprintf('Betha%d é %f\n', index, betha(index));
            if betha(index) >= 1
                fprintf('O sistema não converge pelo critério de Sassenfeld!\n\n');
                y = NaN;
                converge = false;
                return;
            end
            alpha(index) = betha(index);
        end
        fprintf('O sistema converge pelo critério de Sassenfeld!\n\n');
        y = betha;
        converge = true;
    else 
        y =NaN;
        converge = false;
        return;
    end
end