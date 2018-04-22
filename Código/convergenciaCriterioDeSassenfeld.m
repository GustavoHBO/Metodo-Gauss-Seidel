function [y, converge]=convergenciaCriterioDeSassenfeld(matriz)
    format long g;
    [alpha, convercaoLinhas] = convergenciaCriterioDasLinhas(matriz);
    multiplicacao = 0;
    [ll,lc] = size(matriz);
    betha = ones(ll);
    betha(1) = alpha(1);
    for (index = 1:ll)
        multiplicacao = 0;
        for index2 = 1:ll
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
end