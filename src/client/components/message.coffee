import React from 'react'
import Grid from '@material-ui/core/Grid'
import Typography from '@material-ui/core/Typography'
import Box from '@material-ui/core/Box'
import Slide from '@material-ui/core/Slide'

import useStyles from 'client/ui/styles/chat'

export default ({ text }) -> 
    classes = useStyles()    

    <Grid item xs={12}>
        <Slide direction="left" in={true} mountOnEnter>
            <Box className={classes.message} bgcolor="#b0bec5" p={1} mb={2}>
                <Typography component="p" variant="body2" color="textPrimary">{text}</Typography>
            </Box>
        </Slide>
    </Grid>
