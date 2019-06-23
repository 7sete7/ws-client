import React from 'react'
import ReactDOM from 'react-dom'

import Router from './router.coffee'
import UserContextProvider from './hooks/user/UserContextProvider.coffee'
import { ThemeProvider } from '@material-ui/styles'
import Theme from './ui/themes/Purple-Green.coffee'

import './styles/styles.less'

App = () ->
    <ThemeProvider theme={Theme}>
        <UserContextProvider>
            <Router />
        </UserContextProvider>
    </ThemeProvider>

ReactDOM.render(<App />, document.getElementById('root'))
