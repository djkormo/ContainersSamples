#!/bin/bash
# build 
docker build -t minimal-jupyter .

# permission on host directory
sudo chown -R 1000 /root/ContainersSamples


# run 

docker run -p 8888:8888 -d -v /root/ContainersSamples/Docker/jupyter/notebooks:/home/jovyan/notebooks  minimal-jupyter


sleep 15s

# displaying logs

docker logs $(docker ps -q --filter ancestor=minimal-jupyter)

