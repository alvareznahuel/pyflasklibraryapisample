#!/bin/bash
# Ejecuta el script de python derivando la salida de errores a la salida estandar.
docker run --env-file debug.env -p 3000:3000 -p 5001:5000 -t biblioserver 2>&1