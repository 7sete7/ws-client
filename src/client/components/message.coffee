import React from 'react'
import Grid from '@material-ui/core/Grid'
import Typography from '@material-ui/core/Typography'
import Box from '@material-ui/core/Box'
import Slide from '@material-ui/core/Slide'

import useStyles from 'client/ui/styles/chat'

export default ({ payload, user }) -> 
    classes = useStyles()    

    <Grid item xs={1} fullWidth>
        <Slide direction="left" in={true} mountOnEnter>
            <Box className={classes.message} bgcolor="#b0bec5" p={1} mb={2} minWidth="80px">
                <Typography component="p" variant="body2" color="textPrimary">{payload}</Typography>
                <Typography component="p" variant="caption" align="right" color="textSecondary">{user}</Typography>
            </Box>
        </Slide>
    </Grid>
