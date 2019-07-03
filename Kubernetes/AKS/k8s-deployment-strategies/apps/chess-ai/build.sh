
    
DOCKER_REGISTRY=docker.io
DOCKER_PROJECT_ID=djkormo
SERVICE_NAME=chess-ai
DOCKER_IMAGE_NAME=$(DOCKER_PROJECT_ID)/${SERVICE_NAME}
DOCKER_IMAGE_REPO_NAME=$(DOCKER_REGISTRY)/$(DOCKER_IMAGE_NAME)

#  build 
docker build -t chess-ai .
docker build -t chess-ai:blue . -f Dockerfile-blue 
docker build -t chess-ai:green . -f Dockerfile-green


docker tag chess-ai:blue djkormo/chess-ai:blue
docker tag chess-ai:green djkormo/chess-ai:green


docker push  djkormo/chess-ai:blue
docker push  djkormo/chess-ai:green