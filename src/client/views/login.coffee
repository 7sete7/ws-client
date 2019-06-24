import React from 'react'
import Button from '@material-ui/core/Button'
import TextField from '@material-ui/core/TextField'
import Typography from '@material-ui/core/Typography'
import Container from '@material-ui/core/Container'
import Link from '@material-ui/core/Link'
import Box from '@material-ui/core/Box'

import useLogin from 'client/hooks/auth/login.coffee'
import useStyles from 'client/ui/styles/one-form-page'

Login = () ->
    classes = useStyles()
    { usernameField, passField, doLogin, error, helperText } = useLogin()

    return (
        <Container component="section" maxWidth="xs">
            <div className={classes.paper}>
                <Typography element="h1" variant="h5">Login</Typography>
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
                </form>

                <Button type="button" variant="contained" color="primary" fullWidth className={classes.submit} onClick={doLogin}>Entrar</Button>
                <Link href="/#/register" variant="body2">Não possui uma conta ainda?</Link>
            </div>
        </Container>
    )

export default Login