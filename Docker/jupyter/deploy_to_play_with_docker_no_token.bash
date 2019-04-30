#!/bin/bash
# build 
docker build -t minimal-jupyter .


sudo chown -R 1000 /root/ContainersSamples

# run 

#docker run -p 8888:8888 -d --mount source=notebooks,target=/home/jovyan/notebooks  minimal-jupyter
docker run -d -p 8888:8888 minimal-jupyter start-notebook.sh --NotebookApp.token=''

docker run -d -p 8888:8888 -v /root/ContainersSamples/Docker/jupyter/notebooks:/home/jovyan/notebooks minimal-jupyter start-notebook.sh --NotebookApp.token=''

sleep 15s

# displaying logs

docker logs $(docker ps -q --filter ancestor=minimal-jupyter)

