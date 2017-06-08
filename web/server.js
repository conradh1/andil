// MEAN Stack RESTful API Tutorial - Contact List App

var express = require('express');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var app = express();


app.use(express.static(__dirname + '/public'));

app.use(bodyParser.json());

app.listen(8080);
console.log("Server running on port 8080");

app.get('/experiences', function (req, res) {
	console.log('I received a GET request');

	var con = mysql.createConnection({
		host: "localhost",
		user: "web_wallawee",
		password: "W@11@w33",
		database: "wallawee",

	});

	con.connect(function(err) {
		var myquery =
		"select  p.pk_id as id \
		,active as isActive \
		,CONCAT(firstname,' ',lastname) as name \
		,slogan\
		,LEFT(short_description, 50)  as description \
		,50.00 as price\
		,3 as rating\
		,'Provided' as transportation \
		,email \
		from providers p inner join experiences e on e.fk_provider_id = p.pk_id limit 6";
		if (err) throw err;

		con.query(myquery, function (err, rows, fields) {
			if (err) throw err;
				console.log(rows);
				res.json(rows);
		});
	});
});