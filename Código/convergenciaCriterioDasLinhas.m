function [y, converge] =convergenciaCriterioDasLinhas(matriz)
    format long g;
    i = 0;
    soma = 0;
    [ll,lc] = size(matriz);
    for index = 1:ll % Laço for para verificar a convergência pelo critério das linhas.
        soma = 0;
        for index2 = 1:ll % Somatório
            if index ~= index2
                soma = soma + abs(matriz(index, index2));
            end
        end
        alpha(index) = soma / abs(matriz(index, index));
        fprintf('Alpha%d é %f\n', index, alpha(index));
        if alpha(index) >= 1 % Verifica se existe convergência.
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