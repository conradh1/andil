// MEAN Stack RESTful API Tutorial - Contact List App

var express = require('express');
var bodyParser = require('body-parser');
var app = express();


app.use(express.static(__dirname + '/public'));

app.use(bodyParser.json());

app.listen(8080);
console.log("Server running on port 8080");

app.get('/experiences', function (req, res) {
  console.log('I received a GET request');
	var experiences = [
  {
    "id": "1",
    "isActive": true,
    "name": "Bob Somebody",
    "slogan": "Let's go for a rip",
    "description" : "A mountain biking rave.",
    "price" : "50",
    "rating" : "4",
    "keywords" : "mountain bike, adventure, outdoors, trail",
    "transportation": "Yes",
    "email": "bob@nowhere.com"
  },
  {
    "id": "2",
    "isActive": true,
    "name": "Kelly Kook",
    "slogan": "Girls Who Surf",
    "description" : "Want to surf with other girls? Come join us!",
    "keywords" : "surf, water sports, outdoors, ocean, women",
    "price" : "Free",
    "rating": "5",
    "transportation": "Provided",
    "email": "kelly@girlswhosurf.com"
  },
  {
    "id": "3",
    "isActive": true,
    "name": "Bra Boo",
    "slogan": "We like Beer",
    "description" : "Need a local to show you the pub crawl.",
    "keywords" : "pub crawl, city, bars",
    "price" : "20",
    "rating": "3.5",
    "transportation": "None",
    "email": "bra@booze.com"
  },
  {
    "id": "4",
    "isActive": true,
    "name": "Connie Cook",
    "slogan": "I love food!",
    "description" : "Personal Cooking Lessons",
    "keywords" : "cooking, indoors, food, city, lessons",
    "price" : "50",
    "rating": "4",
    "transportation": "Provided",
    "email": "connie@foodmail.com"
  },
  {
    "id": "5",
    "isActive": true,
    "name": "Paul Pictures",
    "slogan": "Photography is Art!",
    "description" : "I provided ",
    "keywords" : "photo, art, outdoors, indoors, lessons",
    "price" : "100",
    "rating": "5",
    "transportation": "Provided",
    "email": "paul@paulspics.com"
  },
  {
    "id": "6",
    "isActive": true,
    "name": "Helen Hiker",
    "slogan": "I like to hike!",
    "description" : "Hiking around Hawaii",
    "keywords" : "hike, outdoors",
    "price" : "Free",
    "rating": "3.5",
    "transportation": "None",
    "email": "helen@hiker.org"
  }
]
	res.json(experiences);
//   db.contactlist.find(function (err, docs) {
//     console.log(docs);
//     res.json(docs);
//   });
});