import React from 'react'
import { Route, Switch, BrowserRouter } from 'react-router-dom'
import useUser from './hooks/user/index.coffee'

import Chat from './views/chat.coffee'
import Login from './views/login.coffee'

export default () ->
    { user, login } = useUser()

    return if user.isLoggedin
        (
            <BrowserRouter>
                <Switch>
                    <Route exact name="Chat" path="/" component={Chat} />
                </Switch>
            </BrowserRouter>
        )
    else
        <BrowserRouter>
            <Switch>
                <Route exact name="Login" path="/" component={Login} />
                <Route exact name="Login" path="/login" component={Login} />
                <Route name="Login" component={Login} />
            </Switch>
        </BrowserRouter>