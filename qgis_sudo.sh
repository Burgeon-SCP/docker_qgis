#!/usr/bin/env bash

XSOCKET=/tmp/.X11-unix

xhost +SI:localuser:root
sudo docker run -ti --rm \
      -e DISPLAY=unix$DISPLAY \
      -v $XSOCKET:$XSOCKET \
      -v ${HOME}/qgis_d_projects:/root \
      docker_qgis $1
xhost -SI:localuser:root
sudo -k
