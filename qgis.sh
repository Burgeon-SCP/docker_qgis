#!/usr/bin/env bash

XSOCKET=/tmp/.X11-unix

echo "[?] Asking Docker"
docker image ls
if [[ $? == 1 ]]; then
  echo "[-] Requesting sudo permission"
  img=$(sudo docker image ls | grep docker_qgis)
if [[ -z $img ]]; then
  sudo docker build . --tag docker_qgis
fi

xhost +SI:localuser:root
sudo docker run -ti --rm \
      -e DISPLAY=unix$DISPLAY \
      -v $XSOCKET:$XSOCKET \
      docker_qgis
xhost -SI:localuser:root
sudo -k
