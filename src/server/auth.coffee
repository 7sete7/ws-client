import bodyParser from 'body-parser'
import Database from './db'
import requiredParameters from 'Utils/required-parameter'
import createHash from 'Utils/createHash'
import express from 'express'
router = express.Router()


router.post '/login', bodyParser.json(), (req, res) ->
    { username, pass } = req.body
    
    validation = requiredParameters ['username', 'pass'], req.body
    if validation.success isnt true
        return res.json validation

    try
        db = await Database.getConnection()
        users = db.collection 'users'

        user = await users.find({ username, password: pass }).toArray()
        if user.length is 0
            return res.json { success: false, reason: ['Usuário não encontrado'] }

        user = user[0]
        hash = createHash()
        expires = new Date Date.now() + (2 * 24 * 60 * 60 * 1000) # 2 days

        # Set hash
        users.updateOne { _id: user._id }, { $set: { services: { hash, expires } } }
        res.json { success: true, hash }
    catch error
        console.error error
        res.json { success: false, reason: [error.message] }

router.post '/register', bodyParser.json(), (req, res) ->
    { username, pass } = req.body
    
    validation = requiredParameters ['username', 'pass'], req.body
    if validation.success isnt true
        return res.json validation

    try
        db = await Database.getConnection()
        users = db.collection 'users'

        usersWithSameNick = await users.find({ username }).toArray()
        if usersWithSameNick.length isnt 0
            return res.json { success: false, reason: ['Username already taken'] }

        hash = createHash()
        expires = new Date Date.now() + (2 * 24 * 60 * 60 * 1000) # 2 days

        await users.insertOne { username, password: pass, services: { hash, expires } }
        res.json { success: true, hash }
    catch error
        console.error error
        res.json { success: false, reason: [error.message] }

router.post '/info', bodyParser.json(), (req, res) ->
    { hash } = req.body
        
    validation = requiredParameters ['hash'], req.body
    if validation.success isnt true
        return res.json validation

    try
        db = await Database.getConnection()
        users = db.collection 'users'

        user = await users.find({ 'services.hash': hash }).toArray()
        if user.length is 0
            return res.json { success: false }
        
        user = user[0]
        if Date.now() > new Date user.services.expires
            return res.json { success: false }

        res.json { success: true, username: user.username }
    catch error
        console.error error
        res.json { success: false }

export default router