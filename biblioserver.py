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
    return 'Lista de libros\n'

@app.route('/biblioteca/libros/<id>', methods = ['GET', 'PUT', 'DELETE']) #, 'PATCH'
def api_librosId(id):
    return 'Detalle del libro con Id=' + id + '\n'

if __name__ == '__main__':
    app.run(host= '0.0.0.0')
