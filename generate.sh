#!/usr/bin/env sh

mkdir -p output

pwd

openssl req -config cert.config -new -x509 \
    -sha256 -newkey rsa:2048 -nodes \
    -keyout output/localhost.key.pem -days 365 \
    -out output/localhost.cert.pem

# print result
openssl x509 -in output/localhost.cert.pem -text -noout



#openssl req -config cert.config -new -sha256 -newkey rsa:2048 -nodes \
#    -keyout output/localhost.key.pem -days 365 -out output/localhost.req.pem
