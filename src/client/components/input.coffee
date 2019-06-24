import React, { useState } from 'react'
import Paper from '@material-ui/core/Paper'
import InputBase from '@material-ui/core/InputBase'
import Button from '@material-ui/core/Button'
import useStyles from 'client/ui/styles/chat'

export default ({ onSend }) -> 
    [text, setText] = useState ''
    classes = useStyles()

    return (
        <Paper className={classes.inputField} square={false}>
            <InputBase 
                value={text} 
                onChange={(e) -> setText e.target.value} 
                inputProps={{ 'aria-label': 'Message' }} 
                placeholder="Message"
                multiline 
                fullWidth 
            />
            <Button onClick={(e) -> onSend(text)(e); setText '' } color="secondary" variant="contained">
                <span>Send</span>
            </Button>
        </Paper>
    )
    