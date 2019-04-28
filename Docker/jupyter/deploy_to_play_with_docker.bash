#!/bin/bash
# build 
docker build -t minimal-jupyter .
# run 
docker run -p 8888:8888 -d minimal-jupyter

sleep 15s

# displaying logs

docker logs $(docker ps -q --filter ancestor=minimal-jupyter)


