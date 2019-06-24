import { createMuiTheme } from '@material-ui/core/styles'
# https://material.io/tools/color/#!/?view.left=0&view.right=0&primary.color=4A148C&secondary.color=00838F

palette = 
  primary: { main: '#4A148C', contrastText: '#ffffff' }
  secondary: { main: '#00838F' }
  error: { main: '#f50057' }

themeName = 'Persian Indigo Blue Lagoon Southern White Rhinocerous';

export default createMuiTheme({ palette, themeName });