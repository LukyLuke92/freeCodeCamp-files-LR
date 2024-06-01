const express = require('express')
const app = express()
const cors = require('cors')
require('dotenv').config()
const mongoose = require('mongoose');
const uri = 'mongodb+srv://lukethrowaway:mongodb@cluster0.uz1slul.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';
const bodyParser = require('body-parser');
mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true });

// Create the schema that will be used for the model
const exerciseSchema = new mongoose.Schema({
  username: String,
  description: [String],
  duration: [Number],
  date: [Date]
});

// Create the model that will be used to generate documents
const exerciseModel = mongoose.model('exercise',exerciseSchema);

app.use(bodyParser.urlencoded({ extended: false }));

app.use(cors())
app.use(express.static('public'))
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html')
});

/* Format of post
username: "fcc_test",
description: "test",
duration: 60,
date: "Mon Jan 01 1990",
_id: "5fb5853f734231456ccb3b05"
*/
// https://3000-freecodecam-boilerplate-7a2y89iwjrj.ws-us114.gitpod.io/api/users/665a3dc38ed085f8a84c60db/logs?(2024-05-20)&(2024-05-31)
// ADD GET CALL HANDLER
app.get('/api/users/:_id/logs?', (req,res) => {
  // use req.query, parse out the dates (and limit if it is included)
  // note that match prints out an array - we only want the first element
  const from = Object.keys(req.query)[0].match(/[0-9]{4}-[0-9]{2}-[0-9]{2}/);
  const fromDate = new Date(from);
  const to = Object.keys(req.query)[1].match(/[0-9]{4}-[0-9]{2}-[0-9]{2}/);
  const toDate = new Date(to);
  const limit = Object.keys(req.query)[2].match(/[0-9]+/);
  exerciseModel.findById(req.params._id)
    .then(user => {
      // Need to implement logic for finding entries within
      // correct dates, then output that data
      // Need to modify the below to get indices using map()
      let dates = user.date.map((el,i) => {
        const date = new Date(el);
        if (date > fromDate && date < toDate) {
          return i;
        } else return ''
      }).filter(String);
      if (limit) {
        dates = dates.slice(0,limit-1);
      }
      res.json({
        _id: req.params._id,
        username: user.username,
        count: user.description.length,
        log: dates.map(el => {
          return {
            description: user.description[el],
            duration: user.duration[el],
            date: new Date(user.date[el]).toDateString()
          }
        })
      })
    })
    .catch(err => {
      console.log(err);
    })
})

app.post('/api/users/:_id/exercises', (req,res) => {
  const date = req.body.date == '' ?
    new Date().toDateString() :
    new Date(req.body.date).toDateString();
  exerciseModel.findById(req.body[':_id']).then(user => {
    user.description.push(req.body.description);
    user.duration.push(req.body.duration);
    user.date.push(date);
    user.save().then(user => {
      res.json({
        _id: req.body[':_id'],
        username: user.username,
        description: req.body.description,
        duration: req.body.duration,
        date: date
      })
    })
  })
});

app.post('/api/users', (req,res) => {
  exerciseModel.create({username: req.body.username})
    .catch(err => console.error(err))
    .then(data => {
      const u_id = data._id;
      res.json({
        username: data.username,
        _id: data._id
      })
    })
})

// add get handler for /api/users to get all users
app.get('/api/users', (req,res) => {
  exerciseModel.find().then(data => {
    return data.map(el => {
      return {
        _id: el._id,
        username: el.username
      }
    })
  })
  .then(data => res.json(data))
})

const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
})
