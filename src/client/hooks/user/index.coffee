import { useContext } from 'react'

import UserContext from './context.coffee'

useUser = () -> 
	context = useContext(UserContext)
	return context


export default useUser;
