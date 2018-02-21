#!/bin/bash
SERVIDOR=localhost
PUERTO=5000
echo "== PRUEBAS GENERALES DEL SERVICIO ================================="
echo ""
echo "-- Recuperar la lista de libros. ----------------------------------"
echo ""
curl -X GET http://$SERVIDOR:$PUERTO/biblioteca/libros
echo ""
echo "-- Recuperar el libro 1. ------------------------------------------"
curl -X GET http://$SERVIDOR:$PUERTO/biblioteca/libros/1
echo ""
echo "== PRUEBAS SOBRE EL END-POINT /biblioteca/libros =================="
echo ""
echo "-- Recuperar la lista de libros. ----------------------------------"
echo ""
curl -v -X GET http://$SERVIDOR:$PUERTO/biblioteca/libros
echo ""
echo "-- Crear un libro 1. ----------------------------------------------"
echo ""
curl -v -X POST http://$SERVIDOR:$PUERTO/biblioteca/libros \
     -H 'Content-Type: application/json' \
     -d '{"titulo": "Organizaciones Exponenciales", "publicado":2014 }'
echo ""
echo "-- Crear un libro 2. ----------------------------------------------"
echo ""
curl -v -X POST http://$SERVIDOR:$PUERTO/biblioteca/libros \
     -H 'Content-Type: application/json' \
     -d '{"titulo": "Bash Guide for Beginners", "publicado":2004 }'
echo ""
echo "-- Recuperar la lista de libros. ----------------------------------"
echo ""
curl -X GET http://$SERVIDOR:$PUERTO/biblioteca/libros
echo ""
echo "-- Intento erroneo de eliminar un libro sin identificarlo. --------"
echo ""
curl -X DELETE http://$SERVIDOR:$PUERTO/biblioteca/libros
echo ""
echo "-- Intento erroneo de actualizar un libro sin identificarlo. ------"
echo ""
curl -X PUT http://$SERVIDOR:$PUERTO/biblioteca/libros
echo ""
echo "** FIN DE LAS PRUEBAS *********************************************"
