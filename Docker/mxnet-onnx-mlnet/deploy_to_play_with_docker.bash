#!/bin/bash
# build 
docker build -t ai-onnx .
# run 
docker run -p 5000:5000 -d ai-onnx