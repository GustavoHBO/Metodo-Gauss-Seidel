function [y, converge] =convergenciaCriterioDasLinhas(matriz, tamanho)
    format long g;
    i = 0;
    soma = 0;
    for index = 1:tamanho
        soma = 0;
        for index2 = 1:tamanho
            if index ~= index2
                soma = soma + abs(matriz(index, index2));
            end
        end
        alpha(index) = soma / abs(matriz(index, index));
        fprintf('Alpha%d é %f\n', index, alpha(index));
        if alpha(index) >= 1
            fprintf('O sistema não converge pelo critério das linhas!\n\n');
            y = 0;
            converge = false;
            return;
        end
    end
    y = alpha;
    converge = true;
    fprintf('O sistema converge pelo critério das linhas!\n\n');
end