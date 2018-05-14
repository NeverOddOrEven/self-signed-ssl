# Create a self-signed certificate

I frequently have to google instructions for how to generate SSL certs. Therefore, I created this repository to remove one more obstacle to properly securing endpoints. 

This configuration generates a certificate valid for localhost, IP v4 127.0.0.1, and IP v6 ::1.

## Usage

From your shell:
```bash
./generate.sh
```

## Commands

Create a self-signed localhost certificate 
```bash
mkdir -p output
openssl req -config cert.config -new -x509 \
    -sha256 -newkey rsa:2048 -nodes \
    -keyout output/localhost.key.pem -days 365 \
    -out output/localhost.cert.pem
```

Show the certificate details
```bash
openssl x509 -in output/localhost.cert.pem -text -noout
```

Create a signing request
```bash
openssl req -config cert.config -new -sha256 -newkey rsa:2048 -nodes \
    -keyout output/localhost.key.pem -days 365 -out output/localhost.req.pem
```

## Testing

You can run the simple Node server in the [./server](./server) directory, and then use curl passing the self-signed certificate.

```bash
node server/index.js
curl http://localhost:8180
curl https://localhost:8181 --cacert output/localhost.cert.pem
```

## Credit
Go to the original [Stack Overflow question](https://stackoverflow.com/questions/10175812/how-to-create-a-self-signed-certificate-with-openssl).
