#!/bin/bash
# build 
docker build -t minimal-jupyter .
# run 
docker run -p 8888:8888 -d minimal-jupyter

# displaying logs

docker logs $(docker ps -q --filter ancestor=minimal-jupyter)


