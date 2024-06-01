var express = require('express');
var cors = require('cors');
// two lines below are syntax for using multer in the code below
// note that if option dest is not included, the file will not be uploaded
// (for this purpose, excluding it may be fine, but is included here anyway)
const multer = require('multer');
const upload = multer({ dest: 'uploads/' })
require('dotenv').config()

var app = express();

app.use(cors());
app.use('/public', express.static(process.cwd() + '/public'));

app.get('/', function (req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Post handler that returns file details
// Note multer syntax expects arg of multer.single() to be name of the file input
// (this is the input element with type "file" in index.html)
app.post('/api/fileanalyse', upload.single('upfile'), (req,res) => {
  // respond with json - req.file contains the uploaded file
  res.json({
    name: req.file.originalname,
    type: req.file.mimetype,
    size: req.file.size
  })
})


const port = process.env.PORT || 3000;
app.listen(port, function () {
  console.log('Your app is listening on port ' + port)
});
