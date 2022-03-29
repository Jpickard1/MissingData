function jaccard=jaccard_index(adj, i, j)
    i_neighbors = (adj(i,:) == 1);
    j_neighbors = (adj(j,:) == 1);
    jaccard = sum(i_neighbors & j_neighbors) / sum(i_neighbors | j_neighbors);
end
