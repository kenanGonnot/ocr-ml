clear ; close all; clc


%% setup the parameters you will use 


load('./dataSet.mat');

constants;

% Shuffle training set
random = randperm(size(Xtrain,1));
Ytrain=Ytrain(random);
Xtrain=Xtrain(random,:);

%% =================== Model Selection (training) ===================
fprintf('\nStart Model Selection\n');

for i = 1:4
	hidden_layer_size=int32(25 * exp(i-1));

	fprintf('\n\n# Test Model with hidden layer %i\n', hidden_layer_size );

	%% ---------------- Part 1: Initializing Pameters
	initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
	initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
	initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

	%% ---------------- Part 2 : Training NN
	options = optimset('MaxIter', 5000);
	lambda = 0.1;

	costFunction = @(p) nnCostFunction(p, ...
	                                   input_layer_size, ...
	                                   hidden_layer_size, ...
	                                   num_labels, Xtrain, Ytrain, lambda);

	[nn_params, cost2] = fmincg(costFunction, initial_nn_params, options);

	Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
	                 hidden_layer_size, (input_layer_size + 1));
	Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
	                 num_labels, (hidden_layer_size + 1));

	%% ---------------- Part 3 : Compute Resulting Cost
	cost = nnCostFunction(nn_params, ...
		                   input_layer_size, ...
		                   hidden_layer_size, ...
		                   num_labels, 
		                   Xval, Yval,
		                   lambda);

	fprintf('\n   final cost : %d', cost );
	
	pred = predict(Theta1, Theta2, Xval);
	fprintf('\n   accuracy   : %f\n', mean(double(pred == Yval)) * 100);
end
