function [known_network, unknown_network] = snowball_removal(network)
    %% Set parameters
    p_discover = 0.5;
    n_discover = round(p_discover * length(network));
    
    %% Define the known edges
    known_network = zeros(size(network));
    
    %% BFS to select the known edges
    %node = round(rand() * length(network));
    queue = [round(rand() * length(network))];
    known_nodes = [];
    while length(known_nodes) < n_discover
        % Set node and pop queue
        node = queue(1);
        queue = queue(2:end);
        % Skip if the node has already been discovered
        if any(known_nodes == node)
            continue;
        end
        % Find edges from the current node
        connections = network(node, :);
        new_nodes = find(connections == true);
        % Add known connections to the network
        for n=new_nodes
            known_network(n, node) = true;
            known_network(node, n) = true;
        end
        % Update the queu and known nodes
        queue = [queue new_nodes];
        known_nodes = [known_nodes node];
        disp(known_network);
    end 
    %% Define the unknown edges
    unknown_network = (network & ~known_network);
end
