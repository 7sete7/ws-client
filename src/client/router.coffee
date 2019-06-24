import React from 'react'
import { Route, Switch, HashRouter } from 'react-router-dom'
import useUser from './hooks/user/index'

import Chat from './views/chat'
import Login from './views/login'
import Register from './views/register'

export default () ->
    { user, login } = useUser()

    return if user.isLoggedin
        (
            <HashRouter>
                <Switch>
                    <Route exact name="Chat" path="/" component={Chat} />
                </Switch>
            </HashRouter>
        )
    else
        <HashRouter>
            <Switch>
                <Route exact name="Login" path="/" component={Login} />
                <Route exact name="Login" path="/login" component={Login} />
                <Route exact name="Register" path="/register" component={Register} />
                <Route name="Login" component={Login} />
            </Switch>
        </HashRouter>