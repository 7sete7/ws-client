import React, { useState } from 'react'
import Message from './message.coffee'
import MongoDB from 'mongodb'

MongoDB.connect('mongodb+srv://leo:%40hotmail.com@cluster-3dw4o.gcp.mongodb.net/test?retryWrites=true&w=majority', { useNewUrlParser: true })
.then (connection) ->
    db = connection.database('ws')
    db.collection('data.Messages').find().toArray().then setMessages
.catch console.error

export default ({ onMessage }) -> 
    [messages, setMessages] = useState []
    onMessage (e) ->
        msg = JSON.parse e.data

        if msg.type is 'message'
            setMessages (msgs) -> msgs.concat(msg.payload)
        
        console.log messages

    return (
        <div style={{ height: '100%', display: 'flex', flexDirection: 'column' }}>
            {
                messages.map (text) -> <Message text={text} />
            }
        </div>
    )
