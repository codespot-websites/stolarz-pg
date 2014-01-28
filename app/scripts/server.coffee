express = require 'express'
app = express()
port = process.env.PORT

app.get '/', (req, res) ->
  res.end 'Hello world'

app.listen port
console.log 'Listening on port ' + port

