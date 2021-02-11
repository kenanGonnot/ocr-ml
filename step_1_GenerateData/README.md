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

