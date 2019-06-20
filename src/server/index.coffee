express = require 'express'
expressWs = require 'express-ws'

app = express()
xws = expressWs(app)

app.use(express.static('dist'))
app.get '/', (req, res) ->
    res.send '<b>OOIIE</b>'

app.ws '/echo', (ws, req) ->
    console.log 'Connected :D'
    ws.on 'message', (msg) ->
        console.log 'Mensagem'
        ws.send msg

app.listen 8080, () -> console.log 'Server listening on port 8080!'