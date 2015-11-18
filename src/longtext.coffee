# Description
#   Long Text to Paste Filter
#
# Configuration:
#   HUBOT_LONGTEXT_MAX
#
# Commands:
#   None
#
# Author:
#   MrSaints

async = require "async"

HUBOT_LONGTEXT_MAX = process.env.HUBOT_LONGTEXT_MAX or 300

module.exports = (robot) ->
    @paste = require("hubot-paste/src/paste")(robot)

    robot.responseMiddleware (context, next, done) ->
        return unless context.plaintext?

        pasteIfLong = (s, cb) ->
            if s.length > HUBOT_LONGTEXT_MAX
                return @paste.dpaste s, "1", (link) =>
                    cb null, link
            cb null, s

        async.map context.strings, pasteIfLong, (err, results) ->
            context.strings = results
            next()
