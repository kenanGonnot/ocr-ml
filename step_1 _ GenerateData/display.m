clear ; close all; clc

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load('matrix.mat');

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);


displayData(X(sel, :), 12);

