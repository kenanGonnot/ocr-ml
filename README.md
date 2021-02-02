# ocr-ml
build our using machine learning (training)
hello

## Generate dataset

```
docker run -v /Users/boris/Downloads/dataset/test:/app/out/ \
          -t belval/trdg:latest \
          trdg -c 100  -w 1 -f 22  -dt /app/out/dic.txt
```

