#!/bin/bash
# build 
docker build -t minimal-jupyter .

# permissions 

sudo chown -R 1000 /root/ContainersSamples

# run 


docker run -d -p 8888:8888 -v /root/ContainersSamples/Docker/jupyter/notebooks:/home/jovyan/notebooks minimal-jupyter start-notebook.sh --NotebookApp.token=''

sleep 15s

# displaying logs

docker logs $(docker ps -q --filter ancestor=minimal-jupyter)

