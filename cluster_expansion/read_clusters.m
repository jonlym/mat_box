function [clusters, ms, Ns, n_cells, interactions, Js] = read_clusters(filename)
    table = readtable(filename);
    clusters = table2struct(table);
    n = length(clusters);
    
    ms = zeros(n, 1);
    Ns = zeros(n, 1);
    n_cells = zeros(n, 1);
    interactions = cell(n, 1);
    Js = zeros(n, 1);
    for i = 1:length(clusters)
        ms(i) = clusters(i).m;
        Ns(i) = clusters(i).N;
        n_cells(i) = clusters(i).n_cell;
        Js(i) = clusters(i).J;
        
        interactions_cell = strsplit(clusters(i).interactions, ' | ');
        interactions{i} = cell(length(interactions_cell), 1);
        for j = 1:length(interactions_cell)
            interactions{i}{j} = str2num(interactions_cell{j})+1;
        end
        clusters(i).interactions = interactions{i};
    end
end