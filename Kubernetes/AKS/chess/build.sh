
    
DOCKER_REGISTRY=docker.io
DOCKER_PROJECT_ID=djkormo
SERVICE_NAME=chess-ai
DOCKER_IMAGE_NAME=$(DOCKER_PROJECT_ID)/${SERVICE_NAME}
DOCKER_IMAGE_REPO_NAME=$(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME)

#  build 
docker build -t chess-ai .
docker build -t chess-ai:blue . -f Docker-blue 
docker build -t chess-ai:green . -f Docker-green

