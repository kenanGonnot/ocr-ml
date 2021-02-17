rp = randperm(size(Xtest,1));


for i = 1:size(Xtest, 1)
    % Display 
    fprintf('\nDisplaying Example Image\n');
    displayData(Xtest(rp(i), :),12);

    pred = predict(Theta1, Theta2, Xtest(rp(i),:));
    %fprintf('\nNeural Network Prediction: %d (digit %d)\n', pred, mod(pred, 10));
    fprintf('\nNeural Network Prediction: %d (true : %d)\n', pred, Ytest(rp(i)));
    
    % Pause with quit option
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end
