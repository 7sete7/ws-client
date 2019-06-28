import { makeStyles } from '@material-ui/core/styles'

useStyles = makeStyles (theme) -> 
    wrapper:
        padding: theme.spacing 1
        height: '100vh'
        display: 'flex'
        flexDirection: 'column'
        boxSizing: 'border-box'
    canvas:
        overflowY: 'auto'
        height: '100%'
    message:
        borderRadius: '10px';
        borderTopLeftRadius: '0';
        width: 'fit-content'
    inputField:
        padding: theme.spacing 1
        display: 'flex'
        '& button':
            width: '10%'
            minWidth: '90px'

export default useStyles