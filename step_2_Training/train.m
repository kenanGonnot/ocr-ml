clear ; close all; clc


%% setup the parameters you will use 
input_layer_size = 264;
hidden_layer_size = 120; 
num_labels = 10;


 


load('../step_1_GenerateData/matrix.mat');
m = size(X, 1);


%% ================ Part 1: Initializing Pameters ================
fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];



%% =================== Part 2 : Training NN ===================
%
fprintf('\nTraining Neural Network... \n')

options = optimset('MaxIter', 1000);

%  You should also try different values of lambda
lambda = 1;


costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, Y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;



check;




