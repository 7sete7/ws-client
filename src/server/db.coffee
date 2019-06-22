import MongoClient from 'mongodb'

instance = null

connect = () ->
    return new Promise (resolve, reject) ->
        MongoClient.connect(process.env.MONGO_URL, { useNewUrlParser: true })
        .then (connection) ->
            instance = connection.db 'ws'
            resolve instance
            console.log 'Mongo connected'
        .catch reject

getConnection = () ->
    return new Promise((resolve, reject) -> 
        if instance?
            return resolve(instance)
        else
            connect().then(resolve).catch(reject)
    )

export default { getConnection: getConnection }
    