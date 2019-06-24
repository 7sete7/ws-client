requiredParameter = (names, object) ->
    if !names instanceof Array
        names = [names]

    res = []
    res.push "Missing required parameter #{item}" for item in names when !item of object

    return { success: !res.length, reason: res }

export default requiredParameter