function [y, converge]=convergenciaCriterioDeSassenfeld(matriz)
    format long g;
    [alpha, convercaoLinhas] = convergenciaCriterioDasLinhas(matriz); % Verifica se existe convergência pelo critério das linhas.
    multiplicacao = 0;
    [ll,lc] = size(matriz);
    betha = ones(ll); % Cria vetor de tamanho ll com 1's.
    betha(1) = alpha(1); % O primeiro valor de betha é igual ao primeiro valor de alpha.
    for (index = 1:ll) % Laço for para calcular e verificar a convergência pelo critério de Sassenfeld
        multiplicacao = 0;
        for index2 = 1:ll % Somatório do valores de betha.
            if index ~= index2
                multiplicacao = multiplicacao + betha(index2)*abs(matriz(index, index2));
            end
        end
        betha(index) = multiplicacao/abs(matriz(index, index));
        fprintf('Betha%d é %f\n', index, betha(index));
        if betha(index) >= 1 % Verifica se existe convergência nesta linha.
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