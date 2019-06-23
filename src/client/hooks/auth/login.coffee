import React, { useState } from 'react'
import useField from '../general/useField.coffee'
import useUser from '../user/index.coffee'

useLogin = () ->
    usernameField = useField ''
    passField = useField ''
    [error, setError] = useState []

    { login } = useUser()

    doLogin = () ->
        setError []
        if !usernameField.value.length
            setError (e) -> e.concat 'username'
        if !passField.value.length
            setError (e) -> e.concat 'password'
        return if error.length

        login usernameField.value, passField.value
    
    helperText = (field, text) ->
        if field in error
            return <span>{text}</span>
        return undefined

    return { usernameField: usernameField, passField: passField, doLogin: doLogin, error: error, helperText: helperText }

export default useLogin
        