#!/bin/bash
# build 
docker build -t customvision-ai .
# run 
docker run -p 33000:80 -d customvision-ai