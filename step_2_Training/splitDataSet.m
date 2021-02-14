
clear ; close all; clc
%% =========== Init =============

load ('../step_1_GenerateData/matrix.mat');

constants;

Xval=[];
Yval=[];

Xtest=[];
Ytest=[];

Xtrain=[];
Ytrain=[];

%% =========== Init =============

fprintf('Create Cross Validation Set\n');

for i = 1:num_labels
	currentBucketIndices = find(Y == i);
	Xcurrent = X(currentBucketIndices, :);
	Ycurrent = Y(currentBucketIndices);

	i
	size(Xcurrent)

	bucketSize = size(Xcurrent,1);
	extractedDataSize = int32(bucketSize*0.2);

	rand_indices = randperm(bucketSize);

	Xval = [Xval ; Xcurrent(rand_indices(1:extractedDataSize), :)];
	Yval = [Yval ; Ycurrent(rand_indices(1:extractedDataSize), :)];

	Xtest = [Xtest ; Xcurrent(rand_indices(extractedDataSize:2*extractedDataSize), :)];
	Ytest = [Ytest ; Ycurrent(rand_indices(extractedDataSize:2*extractedDataSize), :)];

	Xtrain = [Xtrain ; Xcurrent(rand_indices(2*extractedDataSize:bucketSize), :)];
	Ytrain = [Ytrain ; Ycurrent(rand_indices(2*extractedDataSize:bucketSize), :)];


endfor





fprintf('\nCompute Learning Curve\n');

fprintf('\ndata set extracted\n');
size(Xval)
size(Xtest)
size(Xtrain)




save -binary dataSet.mat Xval Yval Xtest Ytest Xtrain Ytrain; 
