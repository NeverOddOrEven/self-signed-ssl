'use strict';

var http = require('http');
var https = require('https');
var fs = require('fs');

var options = {
  key: fs.readFileSync(__dirname + '/../output/localhost.key.pem').toString(),
  cert: fs.readFileSync(__dirname + '/../output/localhost.cert.pem').toString()
};

var insecure_port = 8180;
var secure_port = 8181;
 
function handleRequest(req, res){
    res.end('Hello world.');
}
 
//Create a server

var insecure_server = http.createServer(handleRequest);
var load_insecure = async () => {
    insecure_server.listen(insecure_port, function() {
        console.log("Server listening on: http://localhost:" + insecure_port);
    });
}
load_insecure()

var secure_server = https.createServer(options, handleRequest);
var load_insecure = async () => {
    //Start server
    secure_server.listen(secure_port, function(){
        console.log("Server listening on: https://localhost:" + secure_port);
    });
}
load_insecure()

