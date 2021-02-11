function [theta] = trainNN(X, Y, lambda, input_layer_size, hidden_layer_size, num_labels)
%TRAINLINEARREG Trains linear regression given a dataset (X, y) and a
%regularization parameter lambda
%   [theta] = TRAINLINEARREG (X, y, lambda) trains linear regression using
%   the dataset (X, y) and regularization parameter lambda. Returns the
%   trained parameters theta.
%
%% ================ Part 1: Initializing Pameters ================
fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Part 2 : Training NN ===================
%
fprintf('\nTraining Neural Network... \n')


%  You should also try different values of lambda
lambda = 0.1;

costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, Y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

options = optimset('MaxIter', 20);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

theta = nn_params;
end
