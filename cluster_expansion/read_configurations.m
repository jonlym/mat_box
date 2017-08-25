function [configurations, sigma_mat, E_DFT, E_CE, n_vacancies] = read_configurations(filename)
    table = readtable(filename);
    configurations = table2struct(table);
    n = length(configurations);
    
    sigma_mat = zeros(n, length(str2num(configurations(1).sigma)));
    E_DFT = zeros(n, 1);
    E_CE = zeros(n, 1);
    n_vacancies = zeros(n, 1);
    for i = 1:length(configurations)
        configurations(i).sigma = str2num(configurations(i).sigma);
        sigma_mat(i, :) = configurations(i).sigma;
        E_DFT(i) = configurations(i).E_DFT;
        E_CE(i) = configurations(i).E_CE;
        n_vacancies(i) = configurations(i).n_vacancies;
    end
end