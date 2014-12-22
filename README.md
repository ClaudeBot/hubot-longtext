# Hubot: Long text

A Hubot adapter filter for handling long messages (string length longer than `MAX_STRING_LENGTH`) by returning a link to an online paste containing the message.


## Installation via NPM

1. Install the __hubot-longtext__ module as a Hubot adapter dependency _(e.g. hubot-irc)_ by adding it to your `package.json` file:

    ```
    npm install --save hubot-paste
    ```

2. Require the __hubot-longtext__ module in your main adapter file (containing `send()`) and initialize it by passing it an instance of Hubot.

    ```coffee
    longtext = require("hubot-longtext")(@robot)
    ```

3. The filter requires two parameters `longtext.filter(string, callback)`. The `callback` will be passed a link to the paste containing `string`. Pass the string to be sent via your adapter to the `filter()` first argument and encapsulate your adapter's send function in the callback like so:

    ```coffee
    longtext.filter str, (newStr) ->
        @myAdapter.send target, newStr
    ```


## Example

__irc.coffee:__

```coffee
send: (envelope, strings...) ->
    # ...

    longtext = require("hubot-longtext")(@robot)
    for str in strings
        longtext.filter str, (newStr) ->
            @bot.say target, newStr
```
