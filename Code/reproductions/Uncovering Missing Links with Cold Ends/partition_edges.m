% Description: This function takes in edges and partitions them according
% to various schemes. Current partitioning schemes are:
%   - 'rand': randomly splits edges between training and testing
%   - 'pop': splits them into multiple groups according to popularity
function [training, testing]=partition_edges(adj, partitionType, split_num)
    if strcmp(partitionType, 'rand')
        % splitnum is the percent of edges reserved for testing
        training = logical(zeros(size(adj)));
        testing = logical(zeros(size(adj)));
        for i=1:height(adj)
            for j=i:height(adj)
                if ~adj(i,j)
                    continue
                elseif rand() < split_num
                    training(i,j) = 1;
                    training(j,i) = 1;
                else
                    testing(i,j) = 1;
                    testing(j,i) = 1;
                end
            end
        end
    elseif strcmp(partitionType, 'pop')
        % splitnum is the number of groups to partition the edges into
        disp('Needs to be filled in');
    end
end

% subplot(1,3,1); image(1000*training); subplot(1,3,2); image(1000*testing); subplot(1,3,3); image(1000*adj);

