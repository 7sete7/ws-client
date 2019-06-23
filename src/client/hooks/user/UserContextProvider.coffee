import React, { useReducer } from 'react'
import api from 'Utils/api'
import UserContext from './context'

initialContext = 
    isLoggedin: false

reducer = (state, action) ->
    switch action.type
        when "LOGGED"
            { username } = action.payload
            return { ...state, username: username, isLoggedin: true }
        else
            return state

UserContextProvider = ({ children }) ->
    [user, dispatch] = useReducer reducer, initialContext

    login = (username, pass) -> 
        try
            { data } = await api.post process.env.SERVER_URL + '/login', { username, pass }
            console.log data
            dispatch { type: "LOGGED", payload: { username: "Leo" } }
        catch e
            console.error e

    return <UserContext.Provider value={{ login, user }}>{children}</UserContext.Provider>


export default UserContextProvider