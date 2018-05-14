#!/usr/bin/env sh

mkdir -p output

openssl req -config cert.conf -new -x509 \
    -sha256 -newkey rsa:2048 -nodes \
    -keyout output/localhost.key.pem -days 365 \
    -out output/localhost.cert.pem

#openssl req -config cert.conf -new -sha256 -newkey rsa:2048 -nodes \
#    -keyout output/localhost.key.pem -days 365 -out output/localhost.req.pem
