#!/bin/bash

IMAGE_NAME="image_name"
CONTAINER_NAME="container_name"

docker build -t $IMAGE_NAME .

docker run -d --name $CONTAINER_NAME $IMAGE_NAME

docker exec $CONTAINER_NAME sh -c "cd /opt && zip -r9q /app/layer.zip ."

mkdir generated
docker cp $CONTAINER_NAME:/app/layer.zip ./generated/layer.zip

docker stop $CONTAINER_NAME

docker container rm $CONTAINER_NAME

docker image rm $IMAGE_NAME