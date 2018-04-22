function [matriz, tabela] = trabalhoGaussSeidel()

    precisao = 0.01;
    qtMInteracao = 1000;
    matriz = [1 -5 1 -13 3 16; -5 1 16 -2 -7 7; -17 6 5 -1 4 -14; 2 11 -1 -5 -20 3; 3 -21 -8 -4 5 -5]

    [matriz, tabela] = algoritmoGaussSeidel(matriz, precisao, qtMInteracao);
    T = array2table(tabela, 'VariableNames',{'X','Y','Z', 'W', 'K'})

end