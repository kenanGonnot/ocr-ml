function [error_train, error_val] = ...
    learningCurve(X, Y, Xval, Yval ,lambda, input_layer_size, hidden_layer, num_labels)
m = size(X, 1);

error_train = zeros(m, 1);
error_val   = zeros(m, 1);



for i = 1:(m/100)
	fprintf('   Set size %i\n', i);

	fprintf('\n    - compute theta\n');

theta = trainNN(X(1:i,:), Y(1:i), lambda, input_layer_size, hidden_layer, num_labels);

	fprintf('\n    - compute cost\n');

error_train(i) = nnCostFunction(theta, input_layer_size, hidden_layer, num_labels ,X(1:i,:),Y(1:i), 0);
error_val(i) = nnCostFunction(theta, input_layer_size, hidden_layer, num_labels ,Xval,Yval, 0);


endfor


end


