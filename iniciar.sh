#!/bin/bash
# Ejecutar el script python, derivando el stdout al archivo biblioserverlog.txt, 
# el stderr al stdout y ejecutando el proceso en background
docker run -p 5001:5000 -t biblioserver > biblioserverlog.txt 2>&1 &