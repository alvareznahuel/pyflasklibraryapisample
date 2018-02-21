#!/bin/bash
# Ejecuta el script de python derivando la salida de errores a la salida estandar.
docker run -p 5001:5000 -t biblioserver 2>&1