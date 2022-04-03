function [known_network, unknown_network] = edge_removal(network, method)
    if ~islogical(network)
        network = logical(network);
        disp('WARNING: Edge removal directory is set to work with undirected, unweighted graphs.')
    end
    switch method
        case 'R'
            [known_network, unknown_network] = random_removal(network);
        case 'SB'
            [known_network, unknown_network] = snowball_removal(network);
        case 'CE'
            disp('Cold Ends method not yet impimented')
        case 'RC'
            disp('Right Censoring method not yet impimented')
    end
end