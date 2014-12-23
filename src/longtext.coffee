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

HUBOT_LONGTEXT_MAX = process.env.HUBOT_LONGTEXT_MAX or 300

module.exports = (robot) ->
    @paste = require("hubot-paste/src/paste")(robot)
    robot.addFilter (str, callback) ->
        if str.length > HUBOT_LONGTEXT_MAX
            return @paste.dpaste str, "1", (link) ->
                callback null, link
        callback null, str
