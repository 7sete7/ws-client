import express from 'express'
import expressWs from 'express-ws'
import Database from './db'
import cors from 'cors'
import bodyParser from 'body-parser'
import authRoutes from './auth'

app = express()
xws = expressWs(app)

corsOptions = { origin: process.env.CLIENT_URL }

app.use(cors corsOptions)
app.use(express.static('dist'))
app.get '/', (req, res) ->
    res.send '<b>OOIIE</b>'

app.get '/users', (req, res) ->
    Database.getConnection()
    .then (db) ->        
        users = await db.collection('users').find().toArray()

        res.send users
    .catch (e) ->
        console.error e
        res.send []

app.post '/room', bodyParser.json(), (req, res) ->
    try
        { name, username, type } = req.body

        Database.getConnection()
        .then (db) ->
            rooms = db.collection 'data.Rooms'
            if type is 'group'
                room = await rooms.find({ name, type: 'group' }).toArray()
            else # single
                room = await rooms.find({ $or: [{ name: "#{name}//#{username}" }, { name: "#{username}//#{name}" }], type: 'single' }).toArray()

            if room.length isnt 0
                return res.send { success: true, room: room[0] }
            
            newRoom = await rooms.insertOne { name: "#{name}//#{username}", type, users: [name, username] }
            res.send { success: true, room: newRoom }
    catch error
        console.error error
        res.send { success: false, error: error.message }

app.use '/auth', authRoutes

app.ws '/echo', (ws, req) ->
    console.log 'Connected :D'

    Database.getConnection()
    .then (db) ->        
        stream = db.collection('data.Messages').find({ room: 'global' }).stream()

        stream.on 'data', (item) -> ws.send JSON.stringify item
        stream.on 'end', () -> console.log 'Stream end'
    .catch console.error

    ws.on 'message', (msg) ->
        message = JSON.parse msg
        if message.type is 'message'
            Database.getConnection()
            .then (db) ->
                db.collection('data.Messages').insertOne message
            .catch console.error
    
            console.log 'Mensagem'
            xws.getWss().clients.forEach (c) -> c.send msg
        else if message.type is 'change_room'
            Database.getConnection()
            .then (db) ->
                messsages = db.collection 'data.Messages'
                stream = await messsages.find({ room: message.room.name }).stream()
                
                ws.send JSON.stringify { type: 'change_room' }
                stream.on 'data', (item) -> ws.send JSON.stringify item
            .catch console.error


app.listen process.env.PORT || 8080, () -> console.log "Server listening on port #{process.env.PORT || 8080}!"