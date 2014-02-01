#!/usr/bin/env node
express = require 'express'
app = express()
port = process.env.PORT

app.set('views', 'app/views');
app.set('view engine', 'jade');

app.use(express.static('cache/public'));

app.get '/', (req, res) ->
  res.render 'index'

app.listen port
console.log 'Listening on port ' + port
