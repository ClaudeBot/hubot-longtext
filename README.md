# Hubot: Long text _(Experimental)_

__This script relies on an experimental Hubot feature (message filters) that is only available on [ClaudeBot's fork of Hubot](//github.com/ClaudeBot/hubot). It will not work with the official Hubot repository.__

A Hubot filter script for handling long messages by returning a link to an online paste containing the message.


## Installation via NPM

1. Install the __hubot-longtext__ module as a Hubot dependency by running:

    ```
    npm install --save hubot-longtext
    ```

2. Enable the script by adding the __hubot-longtext__ entry to your `external-scripts.json` file:

    ```json
    [
        "hubot-longtext"
    ]
    ```

3. Run `npm install`


## Configuration

Variable | Default | Description
--- | --- | ---
`HUBOT_LONGTEXT_MAX` | 300 | Any message sent by Hubot that is longer than `HUBOT_LONGTEXT_MAX` string characters will be replaced with a link to the paste containing the message
`HUBOT_LONGTEXT_SERVICE` | Dpaste | _(TBA)_
