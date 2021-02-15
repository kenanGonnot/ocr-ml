

fprintf('\nResult Accuracy\n');

pred = predict(Theta1, Theta2, Xtrain);
fprintf('\n   - Training Set Accuracy         : %f', mean(double(pred == Ytrain)) * 100);

pred = predict(Theta1, Theta2, Xval);
fprintf('\n   - Cross Validation Set Accuracy : %f', mean(double(pred == Yval)) * 100);

pred = predict(Theta1, Theta2, Xtest);
fprintf('\n   - Test Set Accuracy             : %f', mean(double(pred == Ytest)) * 100);

fprintf('\n');


