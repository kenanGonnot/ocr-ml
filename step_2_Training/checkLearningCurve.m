

%% =========== Run learning Curve =============

load('./dataSet.mat')

constants;


fprintf('\nCompute Learning Curve\n');


lambda = 0.1;

random = randperm(size(Xtrain,1));
Ytrain=Ytrain(random);
Xtrain=Xtrain(random,:);

[error_train, error_val] = ...
    learningCurve(Xtrain, Ytrain, ...
                  Xval, Yval, lambda, ...
                  input_layer_size, hidden_layer_size, num_labels);


fprintf('\nerror_train\n');
error_train

fprintf('\nerror_val\n');
error_val


plot(1:m, error_train, 1:m, error_val);
title('Learning curve for linear regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 m/4 0 13])

fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:(m/4)
   fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_val(i));
end


