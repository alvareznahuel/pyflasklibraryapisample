#!/bin/bash
# Ejecutar el script python, derivando el stdout al archivo biblioserverlog.txt, 
# el stderr al stdout y ejecutando el proceso en background
python biblioserver.py > biblioserverlog.txt 2>&1 &