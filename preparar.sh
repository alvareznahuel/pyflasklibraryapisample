#!/bin/bash
# Actualizamos la información de los repositorios de linux.
#sudo apt-get update
# Instalamos la herramienta curl para pruebas, confirmando con yes cualquier pregunta.
sudo apt-get -y install curl
# Instalamos los paquetes requeridos por el desarollo de python.
docker build . -t biblioserver