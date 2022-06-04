% The file 'network_output.mat' contains the output of the forward pass
% obtained with the matconvnet version of the ICLabel neural network when
% 'network_input.mat' is provided.


% Load inputs
load('network_input.mat');

% Load network
netStruct = load('netICL.mat');
net = dagnn.DagNN.loadobj(netStruct);

% Forward pass
net.eval(input);
out = net.getVar(net.getOutputs()).value;

% Output of the network
labels = squeeze(net.getVar(net.getOutputs()).value)';
labels = reshape(mean(reshape(labels', [], 4), 2), 7, [])';

% Save
save('network_output', 'labels');
