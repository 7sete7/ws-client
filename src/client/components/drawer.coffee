import React, { useEffect, useState } from 'react'

import axios from 'axios'

import Drawer from '@material-ui/core/Drawer'
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import ListItemText from '@material-ui/core/ListItemText'
import ListItemIcon from '@material-ui/core/ListItemIcon'
import Divider from '@material-ui/core/Divider'
import UserIcon from '@material-ui/icons/Person'
import Button from '@material-ui/core/Button'

import useStyles from 'client/ui/styles/drawer'
import useRoom from 'client/hooks/room'
import useUser from 'client/hooks/user'

UsersDrawer = () ->
    classes = useStyles()
    { setRoom, room } = useRoom()
    { logout, user } = useUser()
    [users, setUsers] = useState []
    [selected, setSelected] = useState ''

    useEffect(
        () ->
            { data } = await axios.get "#{process.env.SERVER_URL}/users"
            setUsers data
        , []
    )

    onItemClick = (name, type) -> (event) -> 
        setRoom name, type
        setSelected name

    if users.length is 0
        return null

    <nav>
        <Drawer anchor="left" variant="permanent" open className={classes.drawer}>
            <div className={classes.toolbar} />
            <Divider />
            <List>
                <ListItem selected={selected is 'global'} button onClick={onItemClick 'global', 'group'}>
                    <ListItemIcon><UserIcon /></ListItemIcon>
                    <ListItemText primary="Global" />
                </ListItem>
            </List>
            <Divider />
            <List>
                {
                    users.map (u) ->
                        <ListItem button key={u._id} onClick={onItemClick u.username, 'single'} selected={selected is u.username}>
                            <ListItemIcon><UserIcon /></ListItemIcon>
                            <ListItemText primary={u.username} />
                        </ListItem>
                }
            </List>
            <Divider />
            <Button color="primary" variant="contained" onClick={() -> logout()}>Sair</Button>
        </Drawer>
    </nav>

export default UsersDrawer