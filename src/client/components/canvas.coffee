import React, { useState } from 'react'
import Message from './message.coffee'

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
                messages.map (text, i) -> <Message key={i} text={text} />
            }
        </div>
    )
