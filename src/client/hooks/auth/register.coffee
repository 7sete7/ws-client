import React, { useState } from 'react'
import useField from '../general/useField.coffee'
import useUser from '../user/index.coffee'

useLogin = () ->
    usernameField = useField ''
    passField = useField ''
    repeatPassField = useField ''
    [error, setError] = useState {}

    { register } = useUser()

    doRegister = () ->
        setError {}
        hasError = false

        if !usernameField.value.length
            setError (e) -> Object.assign e, { username: 'Preencha o nome de usuário' }
            hasError = true
        if !passField.value.length
            setError (e) -> Object.assign e, { password: 'Preencha a senha' }
            hasError = true
        if !repeatPassField.value.length
            setError (e) -> Object.assign e, { 'repeat-password': 'Preencha a senha novamente' }
            hasError = true
        if passField.value isnt repeatPassField.value
            setError (e) -> Object.assign e, { 'repeat-password': 'As senhas não coincidem' }
            hasError = true

        return if hasError
        register usernameField.value, passField.value
            .then ({ success, reason }) ->
                unless success
                    setError reason
            .catch (error) -> setError error.message
    
    helperText = (field) -> <span>{error[field]}</span>

    return { usernameField: usernameField, passField: passField, repeatPassField: repeatPassField, doRegister: doRegister, error: error, helperText: helperText }

export default useLogin
        