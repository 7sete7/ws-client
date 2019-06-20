import MongoClient from 'mongodb'

mongoURI = 'mongodb+srv://leo:%40hotmail.com@cluster-3dw4o.gcp.mongodb.net/test?retryWrites=true&w=majority'
instance = null

connect = () ->
    return new Promise (resolve, reject) ->
        MongoClient.connect(mongoURI, { useNewUrlParser: true })
        .then (connection) ->
            instance = connection.db 'ws'
            resolve instance
            console.log 'Mongo connected'
        .catch reject

getConnection = () ->
    return new Promise((resolve, reject) -> 
        if instance?
            console.log instance
            return resolve(instance)
        else
            connect().then(resolve).catch(reject)
    )

export default { getConnection: getConnection }
    