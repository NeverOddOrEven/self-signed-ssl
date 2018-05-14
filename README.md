# Create a self-signed certificate

This configuration generates a certificate valid for localhost, IP v4 127.0.0.1, and IP v6 ::1.


Create a self-signed localhost certificate 
```bash
mkdir -p output
openssl req -config cert.conf -new -x509 \
    -sha256 -newkey rsa:2048 -nodes \
    -keyout output/localhost.key.pem -days 365 \
    -out output/localhost.cert.pem
```

Create a signing request
```bash
openssl req -config cert.conf -new -sha256 -newkey rsa:2048 -nodes \
    -keyout output/localhost.key.pem -days 365 -out output/localhost.req.pem
```

# Credit
Go to the original [Stack Overflow question](https://stackoverflow.com/questions/10175812/how-to-create-a-self-signed-certificate-with-openssl).
