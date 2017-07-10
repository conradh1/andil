// MEAN Stack RESTful API Tutorial - Contact List App

var express = require('express');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var app = express();

var whost = "localhost";
var wuser=  "web_wallawee";
var wpass = "W@11@w33";
var wdatabase = "wallawee";

app.use(express.static(__dirname + '/public'));

app.use(bodyParser.json());

app.listen(8080);
console.log("Server running on port 8080");

app.get('/experiences', function (req, res) {
	console.log('GetAllExperiences');

	var con = mysql.createConnection({
		host: whost,
		user: wuser,
		password: wpass,
		database: wdatabase,

	});

	con.connect(function(err) {
		var myquery =
		"select  e.pk_id as id \
		,active as isActive \
		,CONCAT(firstname,' ',lastname) as name \
		,slogan\
		,LEFT(short_description, 80)  as description \
		,image_path_1 as image1 \
		,50.00 as price\
		,3 as rating\
		,'Provided' as transportation \
		,email \
		from providers p inner join experiences e on e.fk_provider_id = p.pk_id limit 6";
		if (err) throw err;

		con.query(myquery, function (err, rows, fields) {
			if (err) throw err;
				//console.log(rows);
				res.json(rows);
		});
	});
});

app.get('/experience/:experienceId', function (req, res) {
  var experienceId = req.params.experienceId;
  console.log("Experience ID: "+experienceId);
  	var con = mysql.createConnection({
		host: whost,
		user: wuser,
		password: wpass,
		database: wdatabase,

	});

	con.connect(function(err) {
		var myquery =
		"select  e.pk_id as id \
		,active as isActive \
		,CONCAT(firstname,' ',lastname) as name \
		,slogan\
		,short_description \
		,description \
		,image_path_1 as image1 \
		,image_path_2 as image2 \
		,image_path_3 as image3 \
		,image_path_4 as image4 \
		,image_path_5 as image5 \
		,50.00 as price\
		,3 as rating\
		,'Provided' as transportation \
		,email \
		from providers p inner join experiences e on e.fk_provider_id = p.pk_id \
		where e.pk_id = "+experienceId;
		if (err) throw err;

		con.query(myquery, function (err, rows, fields) {
			if (err) throw err;
				console.log(rows);
				res.json(rows);
		});
	});

});