function [y, tabela] = algoritmoGaussSeidel(matriz, precisao, qtMInteracao)

    [ll, lc] = size(matriz);
    array = matriz((ll*lc) - ll + 1:(ll*lc));

    matrizAux = 1:1:ll;
    matrizAux = cat(2, matriz, matrizAux');
    matrizAux = abs(matrizAux);
    permL = 0:0:lc;
    for index = 1:ll
        matrizAux = sortrows(matrizAux, 1, 'descend');
        permL(index) = matrizAux(1, lc + 2 - index);
        matrizAux(1,:) = [];
        matrizAux(:,1) = [];
    end
    matriz = matriz([permL],:)

    convergenciaCriterioDeSassenfeld(matriz);

    [ll, lc] = size(matriz);
    r = zeros(1, ll);
    ra = zeros(1, ll);
    i = 0;
    tabelaInteracoes = [];
    tabelaInteracoes = [tabelaInteracoes;r];
    while qtMInteracao > i
        for index = 1:ll
            soma = 0;
            for index2 = 1:ll
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
            ra(index) = r(index);
            r(index) = soma;
        end
        tabelaInteracoes = [tabelaInteracoes;r];
        for index = 1:ll
            erro = abs(r(index) - ra(index));
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