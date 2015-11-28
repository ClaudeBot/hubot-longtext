# Description
#   Long Text to Paste Filter
#
# Configuration:
#   HUBOT_LONGTEXT_MAX
#   HUBOT_LONGTEXT_MAX_LINES
#
# Commands:
#   None
#
# Author:
#   MrSaints

async = require "async"

HUBOT_LONGTEXT_MAX = process.env.HUBOT_LONGTEXT_MAX or 300
HUBOT_LONGTEXT_MAX_LINES = process.env.HUBOT_LONGTEXT_MAX_LINES or false

module.exports = (robot) ->
    @paste = require("hubot-paste/src/paste")(robot, false)

    _flatten = (strings) ->
        flattened = []
        for string in strings
            flattened = flattened.concat string.toString().split(/\r?\n/)
        flattened

    _pasteIfMaxChars = (s, cb) ->
        if s.length > HUBOT_LONGTEXT_MAX
            return @paste.dpaste s, "1", (link) =>
                cb null, link
        cb null, s

    robot.responseMiddleware (context, next, done) ->
        return unless context.plaintext?

        strings = context.strings

        if HUBOT_LONGTEXT_MAX_LINES
            strings = _flatten strings
            if strings.length > HUBOT_LONGTEXT_MAX_LINES
                strings = strings.join("\n")
                return @paste.dpaste strings, "1", (link) =>
                    context.strings = [link]
                    next()

        async.map strings, _pasteIfMaxChars, (err, results) ->
            context.strings = results
            next()
