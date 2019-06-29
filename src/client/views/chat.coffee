import React, { useState } from 'react'
import Container from '@material-ui/core/Container'
import Box from '@material-ui/core/Box'

import Input from '../components/input.coffee'
import Room from '../components/room.coffee'
import Drawer from 'client/components/drawer'

import useUser from 'client/hooks/user'
import useRoom from 'client/hooks/room'
import useStyles from 'client/ui/styles/chat'

export default () ->
    { user } = useUser()
    classes = useStyles()

    if user.isLoggedin        
        { room, ws } = useRoom()

        onSend = (text) -> (event) ->
            msg = 
                payload: text
                type: 'message'
                date: new Date().toISOString()
                user: user.username
                room: room.name

            ws.send JSON.stringify msg

        onMessage = (fn) -> ws.onmessage = fn
        
        (
            <Box id="chat" element="div" display="flex">
                <Drawer />
                <Container component="main" maxWidth={false} className={classes.wrapper}>
                    <Room onMessage={onMessage} />
                    <Input onSend={onSend} />
                </Container>
            </Box>
        )
    else <div></div>
        
