import React, { useReducer, useEffect } from 'react'
import axios from 'axios'
import UserContext from './context'

initialContext = 
    isLoggedin: false

reducer = (state, action) ->
    switch action.type
        when "LOGGED"
            { username, hash } = action.payload
            return { ...state, username, hash, isLoggedin: true }
        when "LOGOUT"
            return initialContext
        else
            return state

UserContextProvider = ({ children }) ->
    [user, dispatch] = useReducer reducer, initialContext

    useEffect(
        () -> 
            hash = window.localStorage.getItem 'hash'
            return if typeof hash isnt 'string'

            { data } = await axios.post "#{process.env.SERVER_URL}/auth/info", { hash }
            if data.success is false
                window.location.hash = '/login'
                window.localStorage.removeItem 'hash'
                window.localStorage.removeItem 'username'
            else
                window.localStorage.setItem 'username', data.username
                window.location.hash = '/'
                dispatch { type: "LOGGED", payload: { username: data.username, hash } }

            return () -> {}
        , []
    )

    login = (username, pass) -> 
        try
            { data } = await axios.post "#{process.env.SERVER_URL}/auth/login", { username, pass }
            return data if data.success isnt true

            window.localStorage.setItem "username", username
            window.localStorage.setItem "hash", data.hash
            window.location.hash = "/"
            dispatch { type: "LOGGED", payload: { username, hash: data.hash } }
        catch e
            console.error e
            return { success: false, reason: [e.message] }

    register = (username, pass) ->
        try
            { data } = await axios.post "#{process.env.SERVER_URL}/auth/register", { username, pass }
            return data if data.success isnt true

            window.localStorage.setItem "username", username
            window.localStorage.setItem "hash", data.hash
            window.location.hash = "/"
            dispatch { type: "LOGGED", payload: { username, hash: data.hash } }
        catch e
            console.error e
            return { success: false, reason: [e.message] }

    logout = () -> 
        dispatch { type: 'LOGOUT' }
        window.localStorage.removeItem 'hash'
        window.localStorage.removeItem 'username'
        window.location.hash = '/login'
        window.location.reload()

    return <UserContext.Provider value={{ login, user, register, logout }}>{children}</UserContext.Provider>


export default UserContextProvider