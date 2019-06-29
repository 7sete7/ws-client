import React from 'react'
import ReactDOM from 'react-dom'

import Router from './router'
import UserContextProvider from './hooks/user/UserContextProvider'
import RoomContextProvider from './hooks/room/RoomContextProvider'
import { ThemeProvider } from '@material-ui/styles'
import Theme from './ui/themes/Purple-Green'
import CssBaseline from '@material-ui/core/CssBaseline'

App = () ->
    <ThemeProvider theme={Theme}>
        <UserContextProvider>
            <RoomContextProvider>
                <CssBaseline />
                <Router />
            </RoomContextProvider>
        </UserContextProvider>
    </ThemeProvider>

ReactDOM.render(<App />, document.getElementById('root'))
