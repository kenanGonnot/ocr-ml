
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

%% =========== Split ============= num_labels

for i = 1:num_labels
	currentBucketIndices = find(Y == i);
	Xcurrent = X(currentBucketIndices, :);
	Ycurrent = Y(currentBucketIndices);


	bucketSize = size(Xcurrent,1);
	extractedDataSize = int32(bucketSize*0.2)-1;

	rand_indices = randperm(bucketSize);

	Xval = [Xval ; Xcurrent(rand_indices(1:extractedDataSize), :)];
	Yval = [Yval ; Ycurrent(rand_indices(1:extractedDataSize), :)];

	Xtest = [Xtest ; Xcurrent(rand_indices(extractedDataSize+1:2*extractedDataSize), :)];
	Ytest = [Ytest ; Ycurrent(rand_indices(extractedDataSize+1:2*extractedDataSize), :)];

	Xtrain = [Xtrain ; Xcurrent(rand_indices(2*extractedDataSize+1:bucketSize), :)];
	Ytrain = [Ytrain ; Ycurrent(rand_indices(2*extractedDataSize+1:bucketSize), :)];

endfor

%% =========== Statistics =============

fprintf('\n•Data set extracted : \n');
fprintf('   Xval   : %i \n', size(Xval, 1));;
fprintf('   Xtest  : %i \n', size(Xtest, 1));
fprintf('   Xtrain : %i \n', size(Xtrain, 1));

total = size(Xval,1) + size(Xtest,1) + size(Xtrain,1);
err= total - size(X,1);
fprintf('\n Total           ====> %i \n', total);
fprintf(' Unsplitted data ====> %i \n', err);

%% =========== Save =============

fprintf('\n Saved in >dataSet.mat< \n');
save -binary dataSet.mat Xval Yval Xtest Ytest Xtrain Ytrain; 

