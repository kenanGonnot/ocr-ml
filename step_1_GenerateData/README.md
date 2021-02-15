## Generate dataset

```
docker run -v ${PWD}/data:/app/out/ -v ${PWD}/:/app/in/ \
          -t belval/trdg:latest \
          trdg -c 1000  -w 1 -f 22  -dt /app/in/dictionary.txt
```

## convert images to matrix

in octave execute : 
``` 
convertImagesToMatrix
```

## Check 

To display 100 random case retrieved from the previous matrix 
```
display
```

Model 1
	hidden layer : 25
	lambda : 0.1
	iteration : 2500

	Result Accuracy
	   - Training Set Accuracy         : 40.083218
	   - Cross Validation Set Accuracy : 37.053571
	   - Test Set Accuracy             : 37.946429

Model 2 
	hidden layer : 120
	lambda : 0.1
	iteration : 2500

    Training Set Accuracy: 70.089286
	Result Accuracy
	   - Training Set Accuracy         : 31.900139
	   - Cross Validation Set Accuracy : 30.803571
	   - Test Set Accuracy             : 32.142857


Model 3
	hidden layer : 240
	lambda : 0.1

	iteration : 2500

	Result Accuracy (run #1) - Iteration  2500
	   - Training Set Accuracy         : 93.065187
	   - Cross Validation Set Accuracy : 91.071429
	   - Test Set Accuracy             : 88.392857

	Result Accuracy (run #2) - Iteration  2500
	   - Training Set Accuracy         : 95.284327
	   - Cross Validation Set Accuracy : 89.285714
	   - Test Set Accuracy             : 93.303571

	iteration : 5000

	Result Accuracy (run #1) - Iteration  5000
	   - Training Set Accuracy         : 97.226075
	   - Cross Validation Set Accuracy : 92.410714
	   - Test Set Accuracy             : 89.732143

	Result Accuracy (run #2) - Iteration  5000 | Cost: 4.530817e-01
	   - Training Set Accuracy         : 96.948682
	   - Cross Validation Set Accuracy : 89.732143
	   - Test Set Accuracy             : 89.285714

	Result Accuracy (run #3) - Iteration  5000 | Cost: 8.603696e-01
	   - Training Set Accuracy         : 90.707351
	   - Cross Validation Set Accuracy : 84.375000
	   - Test Set Accuracy             : 85.267857

Model 4
	hidden layer : 792
	lambda : 0.1
	iteration : 2500

	Result Accuracy
	   - Training Set Accuracy         : 98.474341
	   - Cross Validation Set Accuracy : 90.625000
	   - Test Set Accuracy             : 94.642857


