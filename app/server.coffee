#!/usr/bin/env node
express = require 'express'
app = express()
port = process.env.PORT

app.set('views', 'app/views');
app.set('view engine', 'jade');

app.use(express.static('cache/public'));
app.use(express.static('app/public/static'));

app.get '/', (req, res) ->
	res.render 'index'

app.get '/uslugi', (req, res) ->
	res.render 'services'

app.get '/realizacje', (req, res) ->
	res.render 'gallery'

app.get '/kontakt', (req, res) ->
	res.render 'contact'

app.listen port
console.log 'Listening on port ' + port
