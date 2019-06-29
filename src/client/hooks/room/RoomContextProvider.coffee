import React, { useReducer, useEffect } from 'react'
import axios from 'axios'
import RoomContext from './context'

initialContext = 
    room: 
        name: 'global'
    ws: null

reducer = (state, action) ->
    switch action.type
        when "ROOM_CHANGED"
            { name, id } = action.payload
            return { ...state, room: { name, id } }
        when "CONNECTED"
            { ws } = action.payload
            return { ...state, ws }
        else
            return state

RoomContextProvider = ({ children }) ->
    [state, dispatch] = useReducer reducer, initialContext

    useEffect(
        () ->
            isWss = !/localhost/.test(process.env.SERVER_URL)
            webSocket = new WebSocket("ws#{if isWss then 's' else ''}://#{(process.env.SERVER_URL or '').replace(/https?:\/\//, '')}/echo")

            dispatch { type: "CONNECTED", payload: { ws: webSocket } }
        , []
    )

    setRoom = (name, type) ->
        username = window.localStorage.getItem 'username'
        { data } = await axios.post "#{process.env.SERVER_URL}/room", { name, username, type }
        if data.success isnt true 
            throw new Error()
        
        console.log data, state
        state.ws.send JSON.stringify { type: 'change_room', room: data.room }
        dispatch { type: 'ROOM_CHANGED', payload: { name: data.room.name, id: data.room._id } }

    return <RoomContext.Provider value={{ setRoom, ...state }}>{children}</RoomContext.Provider>


export default RoomContextProvider