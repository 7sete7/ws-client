import React from 'react'
import Container from '@material-ui/core/Container'
import Typography from '@material-ui/core/Typography'
import TextField from '@material-ui/core/TextField'
import Link from '@material-ui/core/Link'
import Button from '@material-ui/core/Button'
import Grid from '@material-ui/core/Grid'
import Box from '@material-ui/core/Box'

import useStyles from 'client/ui/styles/one-form-page'
import useRegister from 'client/hooks/auth/register'

Register = () ->
    classes = useStyles()
    { usernameField, passField, repeatPassField, doRegister, error, helperText } = useRegister()
    console.log error

    <Container component="section" maxWidth="xs">
        <div className={classes.paper}>
            <Typography element="h1" variant="h5">Cadastre-se</Typography>
            {
                if error instanceof Array
                    for e in error
                        <Box bgcolor="error.main" p={2} m={1} key={e}>
                            { e }
                        </Box>
            }
            <form className={classes.form} noValidate>
                <TextField 
                    variant="outlined"
                    margin="normal"
                    label="Nome de usuário"
                    name="username"
                    autoComplete="login"
                    error={'username' of error}
                    helperText={helperText('username')}
                    fullWidth
                    required
                    {...usernameField}
                />

                <TextField 
                    variant="outlined"
                    margin="normal"
                    label="Senha"
                    name="password"
                    autoComplete="password"
                    type="password"
                    error={'password' of error}
                    helperText={helperText('password')}
                    fullWidth
                    required
                    {...passField}
                />

                <TextField 
                    variant="outlined"
                    margin="normal"
                    label="Repita sua senha"
                    name="repeat-password"
                    autoComplete="password"
                    type="password"
                    error={'repeat-password' of error}
                    helperText={helperText('repeat-password')}
                    fullWidth
                    required
                    {...repeatPassField}
                />
            </form>

            <Button type="button" variant="contained" color="primary" fullWidth className={classes.submit} onClick={doRegister}>Cadastrar</Button>
            <Link onClick={() => window.location.hash = "/"} variant="body2">Já possui uma conta?</Link>
        </div>
    </Container>

export default Register