#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Flask expone el servicio hacia la red.
from flask import Flask, url_for
from flask import request
from flask import json
from flask import Response

app = Flask(__name__)

@app.route('/biblioteca/libros', methods = ['GET', 'POST'])
def api_libros():
    if request.method == 'GET':
        resp = Response(json.dumps(libros), status=200, mimetype='application/json')
    else: #POST
        if request.headers['Content-Type'] == 'application/json':
            if "id" in request.json.keys():
                data = {
                    "error"  : "No debe especificar 'id'."
                }
                resp = Response(json.dumps(data), status=400, mimetype='application/json')
            elif "titulo" not in request.json.keys():
                data = {
                    "error"  : "Debe especificar 'titulo'."
                }
                resp = Response(json.dumps(data), status=400, mimetype='application/json')
            elif "publicado" not in request.json.keys():
                data = {
                    "error"  : "Debe especificar 'publicado'."
                }
                resp = Response(json.dumps(data), status=400, mimetype='application/json')
            elif type(request.json["publicado"]) is not int:
                data = {
                    "error"  : "'publicado' debe ser numerico."
                }
                respResponse(json.dumps(data), status=400, mimetype='application/json')
            else:
                libro = request.json
                libro["id"] = len(libros) + 1
                libros.append(libro)
                resp = Response(None, status=201, mimetype='application/json')
                resp.headers['Location'] = 'http://%s/biblioteca/libros/%s' % (request.headers.environ['HTTP_HOST'],len(libros))
        else:
            resp = Response(None, status=415, mimetype='application/json')
    return resp

@app.route('/biblioteca/libros/<id>', methods = ['GET']) #, 'PATCH', 'PUT', 'DELETE'
def api_librosId(id):
    if not id.isdigit():
        data = {
            "error"  : "El 'id' debe ser numerico."
        }
        resp = Response(json.dumps(data), status=400, mimetype='application/json')
    else:
        i = int(id)
        if i==0 or i > len(libros):
            resp = Response(None, status=404, mimetype='application/json')
        else:
            libro = libros[int(id)-1]
            resp = Response(json.dumps(libro), status=400, mimetype='application/json')
    return resp

if __name__ == '__main__':
    libros = []
    app.run(host= '0.0.0.0')
