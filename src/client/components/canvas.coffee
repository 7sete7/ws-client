import React, { useState, useRef } from 'react'
import Message from './message.coffee'
import Grid from '@material-ui/core/Grid'

import useStyles from 'client/ui/styles/chat'

export default ({ onMessage }) -> 
    [messages, setMessages] = useState []
    canvasEl = useRef null
    classes = useStyles()

    onMessage (e) ->
        msg = JSON.parse e.data

        if msg.type is 'message'
            setMessages (msgs) -> msgs.concat(msg.payload)
            canvasEl.current.scrollTo 0, canvasEl.current.clientHeight

    return (
        <Grid container direction="row" ref={canvasEl} className={classes.canvas}>
            {
                messages.map (text, i) -> <Message key={i} text={text} />
            }
        </Grid>
    )
