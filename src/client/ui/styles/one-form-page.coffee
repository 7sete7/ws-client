import { makeStyles } from '@material-ui/core/styles'

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

export default useStyles