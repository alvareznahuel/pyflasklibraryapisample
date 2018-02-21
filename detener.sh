#!/bin/bash
# Envia la señal de stop a todos los docker.
docker stop $(docker ps -q)