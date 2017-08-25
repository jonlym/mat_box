function pi = get_correlation_matrix(configurations, clusters)
    pi = zeros(length(configurations), length(clusters));
    for i = 1:length(configurations)
        for j = 1:length(clusters)
            pi(i, j) = get_correlation_element(configurations(i).sigma, ...
                                               clusters(j).m, ...
                                               clusters(j).N, ...
                                               clusters(j).interactions);
        end
    end
end

function out = get_correlation_element(sigma, m, N, interactions)
    if isempty(interactions{1})
        out = 1;
    else
        interactions_sum = 0;
        for i = 1:length(interactions)
            interactions_prod = 1;
            for j = 1:length(interactions{i})
                interactions_prod = interactions_prod * sigma(interactions{i}(j));
            end
            interactions_sum = interactions_sum + interactions_prod;
        end
        out = interactions_sum/(m * N);
    end
end