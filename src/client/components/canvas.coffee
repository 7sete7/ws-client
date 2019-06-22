import React, { useState, useRef } from 'react'
import Message from './message.coffee'

export default ({ onMessage }) -> 
    [messages, setMessages] = useState []
    canvasEl = useRef null

    onMessage (e) ->
        msg = JSON.parse e.data

        if msg.type is 'message'
            setMessages (msgs) -> msgs.concat(msg.payload)
            canvasEl.current.scrollTo 0, canvasEl.current.clientHeight

    return (
        <div ref={canvasEl} style={{ height: '100%', display: 'flex', flexDirection: 'column', overflowY: 'auto' }}>
            {
                messages.map (text, i) -> <Message key={i} text={text} />
            }
        </div>
    )
