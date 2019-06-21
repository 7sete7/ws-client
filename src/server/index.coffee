import express from 'express'
import expressWs from 'express-ws'
import Database from './db.coffee'

app = express()
xws = expressWs(app)

app.use(express.static('dist'))
app.get '/', (req, res) ->
    res.send '<b>OOIIE</b>'

app.ws '/echo', (ws, req) ->
    console.log 'Connected :D'

    Database.getConnection()
    .then (db) ->        
        stream = db.collection('data.Messages').find().stream()

        stream.on 'data', (item) -> ws.send JSON.stringify item
        stream.on 'end', () -> console.log 'Stream end'
    .catch console.error

    ws.on 'message', (msg) ->
        Database.getConnection()
        .then (db) ->
            db.collection('data.Messages').insertOne JSON.parse msg
        .catch console.error
 
        console.log 'Mensagem'
        ws.send msg

app.listen process.env.PORT || 8080, () -> console.log "Server listening on port #{process.env.PORT || 8080}!"