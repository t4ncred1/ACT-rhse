#!/bin/sh

docker build --tag=rhse ./rhse-docker && \
docker run -d \
  -it \
  --name rhsec \
  --mount type=bind,source=$(pwd)/Ride-Hailing-Service-Emulator,target=/rhse \
  rhse:latest
