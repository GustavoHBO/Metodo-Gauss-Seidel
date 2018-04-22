function [y, tabela] = algoritmoGaussSeidel(matriz, precisao, qtMInteracao)

    [ll, lc] = size(matriz); % Captura a quantidade de linhas e de colunas da matriz, respectivamente.
    array = matriz((ll*lc) - ll + 1:(ll*lc)); % Captura os valores constantes da matriz extendida do sistema.
    %%%% Formata a matriz para por os maiores valores da linha na diagonal principal.
    matrizAux = 1:1:ll; % Inicializa um vetor com valores sequênciais, incrementados por 1 até a quantidade de linhas da matriz.
    matrizAux = cat(2, matriz, matrizAux'); % Concatena a matriz do sistema com a transposta do vetor 'matrizAux'.
    matrizAux = abs(matrizAux); % Torna todos os valores da matriz absolutos.
    permL = 0:0:lc; % Declara o vetor de permutação.
    for index = 1:ll % For para calcular a maior linha.
        matrizAux = sortrows(matrizAux, 1, 'descend'); % Ordena a matriz por linha em decrescente utilizando como parâmetro o primeiro item da linha.
        permL(index) = matrizAux(1, lc + 2 - index); % Salva o id da maior linha.
        matrizAux(1,:) = []; % Retira a linha da matriz.
        matrizAux(:,1) = []; % Retira a coluna da matriz.
    end
    matriz = matriz([permL],:) % Faz a permutação das linhas da matriz seguindo o vetor de permutação.

    convergenciaCriterioDeSassenfeld(matriz); % Verifica a convergência do sistema.

    [ll, lc] = size(matriz);
    r = zeros(1, ll); % Inicializa o vetor com ll elementos 0's.
    ra = zeros(1, ll);
    i = 0;
    tabelaInteracoes = [];
    tabelaInteracoes = [tabelaInteracoes;r]; % Concatena a tabelaInteracoes com r.
    while qtMInteracao > i % While para execução das interações.
        for index = 1:ll
            soma = 0;
            for index2 = 1:ll % Somatório do produto da incógnita com o sistema.
                if(index ~= index2)
                    soma = soma + matriz(index, index2)*r(index2);
                else
                    soma = soma - array(index);
                end
            end
            if matriz(index, index) > 0
                soma = soma * -1;
            end
            soma = soma/abs(matriz(index,index));
            ra(index) = r(index); % Salva o valor calculado anteriormente.
            r(index) = soma; % Salva o novo valor da incógnita.
        end
        tabelaInteracoes = [tabelaInteracoes;r];
        for index = 1:ll % Verifica se o critério de erro foi alcançado.
            erro = abs(r(index) - ra(index)); % Fórmula de cálculo do erro.
            if ( erro < precisao & i ~= 0 & index == ll)
                tabela = tabelaInteracoes;
                y = r;
                return;
            end
        end
        i = i + 1;
    end
    y = NaN;
end