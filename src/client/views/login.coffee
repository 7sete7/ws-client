import React from 'react'
import Button from '@material-ui/core/Button'
import CssBaseline from '@material-ui/core/CssBaseline'
import TextField from '@material-ui/core/TextField'
import Typography from '@material-ui/core/Typography'
import { makeStyles } from '@material-ui/core/styles'
import Container from '@material-ui/core/Container'
import { Link as Link } from 'react-router-dom'
import useLogin from 'client/hooks/auth/login.coffee'

useStyles = makeStyles (theme) -> 
    paper: 
        marginTop: theme.spacing 10
        display: 'flex'
        flexDirection: 'column'
        alignItems: 'center'
    form:
        marginTop: theme.spacing 1
    submit:
        margin: theme.spacing 3, 0, 2
    theLink:
        textDecoration: 'none'
        '&:hover':
            textDecoration: 'underline'

Login = () ->
    classes = useStyles()
    { usernameField, passField, doLogin, error, helperText } = useLogin()

    return (
        <Container component="section" maxWidth="xs">
            <CssBaseline />
            <div className={classes.paper}>
                <Typography element="h1" variant="h5">Login</Typography>
                <form className={classes.form} noValidate>
                    <TextField 
                        variant="outlined"
                        margin="normal"
                        label="Nome de usuário"
                        name="username"
                        autoComplete="login"
                        error={'username' in error}
                        helperText={helperText('username', 'Preencha o nome de usuário')}
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
                        error={'password' in error}
                        helperText={helperText('password', 'Preencha a senha')}
                        fullWidth
                        required
                        {...passField}
                    />
                </form>

                <Button type="button" variant="contained" color="primary" fullWidth className={classes.submit} onClick={doLogin}>Entrar</Button>
                <Link to="/register" variant="body2" className={classes.theLink}>Não possui uma conta ainda?</Link>
            </div>
        </Container>
    )

export default Login