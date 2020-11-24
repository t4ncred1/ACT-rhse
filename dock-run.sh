#!/bin/sh
if ! docker images --format "{{.Repository}}" | grep -q rhse; then
  echo "building the image...";
  docker build --tag=rhse ./rhse-docker
fi

if ! docker container ls -a --format "{{.Names}}" | grep -q rhsec; then
  echo "creating the container...";
  docker run -d \
    -it \
    --name rhsec \
    --net=host --env="DISPLAY" \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
    --mount type=bind,source=$(pwd)/Ride-Hailing-Service-Emulator,target=/rhse \
    rhse:latest;
else  
  if ! docker ps --format "{{.Names}}" | grep -q rhsec; then
    echo "starting the container...";
    docker start rhsec;
  fi
fi
docker exec -it rhsec bash;
