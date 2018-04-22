function [rx, tabela] = trabalhoGaussSeidel()

    precisao = 0.01; % Define a precisão do erro pela diferença entre o valor atual pelo anterior.
    qtMInteracao = 1000; % Quantidade máxima de interações.
    matriz = [1 -5 1 -13 3 16; -5 1 16 -2 -7 7; -17 6 5 -1 4 -14; 2 11 -1 -5 -20 3; 3 -21 -8 -4 5 -5] % Sistema extendido, utilizando o definido no documento descritivo.

    [rx, tabela] = algoritmoGaussSeidel(matriz, precisao, qtMInteracao); % Computa o valor das incógnitas e retorna a tabela de interações.
    T = array2table(tabela, 'VariableNames',{'X','Y','Z','W','K'}) % Exibe a tabela formatada com a descrição da variável.

    endtra