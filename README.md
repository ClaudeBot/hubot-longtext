# Hubot: Long text

A Hubot adapter filter for handling long messages (string length longer than `MAX_STRING_LENGTH`) by returning a link to an online paste containing the message.


# Example

__irc.coffee:__

```coffee
send: (envelope, strings...) ->
    # ...

    longtext = require("hubot-longtext")(@robot)
    for str in strings
        longtext.filter str, (newStr) ->
            @bot.say target, newStr
```
