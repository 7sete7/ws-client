import React, { useState } from 'react'
import Container from '@material-ui/core/Container'

import Input from '../components/input.coffee'
import Canvas from '../components/canvas.coffee'
import useUser from 'client/hooks/user'
import useStyles from 'client/ui/styles/chat'

export default () ->
    { user } = useUser()
    classes = useStyles()

    if user.isLoggedin
        isWss = !/localhost/.test(process.env.SERVER_URL)
        webSocket = new WebSocket("ws#{if isWss then 's' else ''}://#{(process.env.SERVER_URL or '').replace(/https?:\/\//, '')}/echo");

        onSend = (text) -> (event) ->
            msg = 
                payload: text
                type: 'message'
                date: new Date().toISOString()
                user: user.username

            webSocket.send JSON.stringify msg

        onMessage = (fn) -> webSocket.onmessage = fn
        
        (
            <div id="chat">
                <Container component="section" maxWidth={false} className={classes.wrapper}>
                    <Canvas onMessage={onMessage} />
                    <Input onSend={onSend} />
                </Container>
            </div>
        )
    else <div></div>
        
