createHash = () ->
    carachteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/+'
    random = () -> Math.random().toString().split('.')[1]
    hash = ""

    for a in [0..43]
        hash += carachteres[random() % carachteres.length]

    return hash + '='

export default createHash