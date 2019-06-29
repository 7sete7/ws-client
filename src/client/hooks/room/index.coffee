import { useContext } from 'react'

import RoomContext from './context.coffee'

useRoom = () -> 
	context = useContext(RoomContext)
	return context


export default useRoom;
