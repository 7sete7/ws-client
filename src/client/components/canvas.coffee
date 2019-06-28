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
            setMessages (msgs) -> msgs.concat(msg)
            canvasEl.current.scrollTo 0, canvasEl.current.clientHeight

    return (
        <Grid container direction="column" ref={canvasEl} className={classes.canvas}>
            {
                messages.map (message, i) -> <Message key={i} {...message} />
            }
        </Grid>
    )
