import { makeStyles, useTheme } from '@material-ui/styles'

drawerWidth = 200

useStyles = makeStyles (theme) ->
    drawer:
        [theme.breakpoints.up('sm')]:
            width: drawerWidth
            flexShrink: 0
        '&> div':
            padding: theme.spacing 2
            width: drawerWidth
    toolbar: theme.mixins.toolbar

export default useStyles