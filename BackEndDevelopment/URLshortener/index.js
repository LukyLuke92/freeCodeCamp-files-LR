require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');
const dns = require('node:dns');

// Basic Configuration
const port = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({extended: false}));

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

// Create object that contains all short urls
let shortURLs = [];
let counter = 1;
// const regex = /^(https|http):\/\/www.[0-9a-z]+(.com|.org|.net|.co|.us|.edu|.ai|.io|.gov|.info|.site)$/i
const regex = /^(https:\/\/|http:\/\/)(www.)?[0-9a-z\-\.]*(\.com|\.org|\.net|\.co|\.us|\.edu|\.ai|\.io|\.gov|\.info|\.site)/i

// short URL post call
app.post('/api/shorturl', (req,res) => {
  console.log(req.body.url)
  if (regex.test(req.body.url)) {
    const dnsurl = req.body.url.replace(
      /^(https|http):\/\/(www.)?/,''
      // /^(https|http):\/\//,''
    )
    .replace(/(\.com|\.org|\.net|\.co|\.us|\.edu|\.ai|\.io|\.gov|\.info|\.site).*/i,'$1')
    console.log(dnsurl)
    dns.lookup(dnsurl,(err) => {
      if (err) return res.json({error: 'invalid url'});
      shortURLs.push({url: req.body.url, shorturl: counter})
      res.json({ original_url : req.body.url, short_url : counter});
      counter++;
    })
  } else {
    res.json({error: 'invalid url'});
  }
})

// short URL get call
app.get('/api/shorturl/:id',(req,res) => {
  const shortURLi = shortURLs.findIndex((el) => el.shorturl == req.params.id)
  res.redirect(shortURLs[shortURLi].url)
})

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});
