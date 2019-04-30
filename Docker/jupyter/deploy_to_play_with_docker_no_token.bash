#!/bin/bash
# build 
docker build -t minimal-jupyter .
# run 

#docker run -p 8888:8888 -d --mount source=notebooks,target=/home/jovyan/notebooks  minimal-jupyter
docker run -d -p 8888:8888 minimal-jupyterstart-notebook.sh --NotebookApp.token=''

sleep 15s

# displaying logs

docker logs $(docker ps -q --filter ancestor=minimal-jupyter)

