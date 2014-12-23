MAX_STRING_LENGTH = 300

class Longtext
    constructor: (@robot) ->
        @paste = require("hubot-paste/src/paste")(@robot)

    filter: (str, callback) ->
        if str.length > MAX_STRING_LENGTH
            return @paste.dpaste str, "1", callback
        callback str

module.exports = (robot) ->
    new Longtext robot
