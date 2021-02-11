function [theta] = trainNN(X, Y, lambda, input_layer_size, hidden_layer_size, num_labels)
%TRAINLINEARREG Trains linear regression given a dataset (X, y) and a
%regularization parameter lambda
%   [theta] = TRAINLINEARREG (X, y, lambda) trains linear regression using
%   the dataset (X, y) and regularization parameter lambda. Returns the
%   trained parameters theta.
%

% Initialize Theta
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_theta = [initial_Theta1(:) ; initial_Theta2(:)];

costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, Y, lambda);

% Now, costFunction is a function that takes in only one argument
options = optimset('MaxIter', 20, 'GradObj', 'on');
% options = optimset('MaxIter', 200, 'GradObj', 'on');
% options = optimset('MaxIter', 20);

% Minimize using fmincg
theta = fmincg(costFunction, initial_theta, options);

end
