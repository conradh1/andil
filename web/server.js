// MEAN Stack RESTful API Tutorial - Contact List App

var express = require('express');
var bodyParser = require('body-parser');
var app = express();


app.use(express.static(__dirname + '/public'));

app.use(bodyParser.json());

app.listen(8080);
console.log("Server running on port 8080");