%% Initialization 
clear; close all; clc

inputFolder = "./data/*.jpg"; 
targetSize = 12;

%% ================== Read data ================== 


files = glob(inputFolder);

X =[];
Y =[];

for i=1:numel(files)
	[~, name] = fileparts (files{i});

  	rawx = imread(files{i});

	[h, l] = size(rawx);

	columnToRemove = l - (targetSize-1);
	fromColumn = round(columnToRemove / 2);



  	x = rawx(:, fromColumn:(targetSize-1)+fromColumn);
  	X = [X ; x(:)'];

	y = str2num(substr(name,1, 1));
	Y = [Y ; y];

endfor


save -binary matrix.mat X Y;         % save X, Y, and Z matrices to myfile.mat






