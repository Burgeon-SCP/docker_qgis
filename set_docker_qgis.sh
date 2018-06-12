#!/usr/bin/env bash
# Installation script for docker_qgis

echo "[?] Asking Docker"
docker image ls
if [[ $? == 1 ]]; then
  echo "[-] Requesting sudo permission"
  sudo_docker=TRUE
else
  sudo_docker=FALSE
fi

if [[ $sudo_docker == TRUE ]]; then
  sudo docker build . --tag docker_qgis
  sudo cp -f qgis_sudo.sh /usr/bin/qgis_d
  sudo chmod +x /usr/bin/qgis_d
  if [[ -d ${HOME}/bin ]]; then
    ln -sf /usr/bin/qgis_d ${HOME}/bin/qgis_d
  fi
else
  docker build . --tag docker_qgis
  cp -f qgis.sh ${HOME}/bin/qgis_d
  chmod +x ${HOME}/bin/qgis_d
fi

if [[ ! -d ${HOME}/qgis_d_projects ]]; then
  mkdir ${HOME}/qgis_d_projects
  chmod 755 ${HOME}/qgis_d_projects
fi
