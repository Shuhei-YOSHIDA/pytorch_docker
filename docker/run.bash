#!/bin/bash

set -ex

XSOCK=/tmp/.X11-unix
XAUTH=$HOME/.Xauthority
SHARED_DOCKER_DIR=/shared_dir
SHARED_HOST_DIR=$HOME/shared_dir
IMAGE="shuhei/pytorch_template" # Docker Image Name
VOLUMES="--volume=$XSOCK:$XSOCK:rw
         --volume=$XAUTH:$XAUTH:rw
         --volume=$SHARED_HOST_DIR:$SHARED_DOCKER_DIR:rw"
         #--volume=/media:/media:rw if need, insert above lines

USER_ID="$(id -u)"
RUNTIME="--gpus all"


NAME="pytorch_template"
name_arg=$1
if [ "$name_arg" != "" ]; then
    NAME=$name_arg
fi

echo "Launching $IMAGE"
echo "Without --rm option"

docker run \
    -it \
    --name $NAME \
    $VOLUMES \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY=${DISPLAY}" \
    --env="USER_ID=$USER_ID" \
    --env="NVIDIA_VISIBLE_DEVICES=all" \
    --env="NVIDIA_DRIVER_CAPABILITIES=utility,compute,graphics" \
    --privileged \
    --net=host \
    $RUNTIME \
    $IMAGE
