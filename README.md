# hubot-longtext

[![Build Status](https://travis-ci.org/ClaudeBot/hubot-longtext.svg)](https://travis-ci.org/ClaudeBot/hubot-longtext)
[![devDependency Status](https://david-dm.org/ClaudeBot/hubot-longtext/dev-status.svg)](https://david-dm.org/ClaudeBot/hubot-longtext#info=devDependencies)

__This script relies on a new Hubot [v2.17.0](https://github.com/github/hubot/blob/master/CHANGELOG.md#v2170) feature known as ['response middleware'](https://github.com/github/hubot/pull/1021). It WILL NOT work on older versions of Hubot.__

A Hubot script for handling long messages by returning a link to an online paste containing the message.

This script is useful for _automatically_ capturing long Hubot responses (e.g. help text) that would otherwise flood your chat channel / room. A captured response is then converted into an online paste, and a link to the paste is returned.

### Process

- If enabled, check if the number of string lines is more than `HUBOT_LONGTEXT_MAX_LINES` (accounts for `\n`, and `\r`);
- If the previous condition is not met, check if the number of characters for each string exceeds `HUBOT_LONGTEXT_MAX`;
- If any of the condition above is met, the string is exported to an online paste.

See [`src/longtext.coffee`](src/longtext.coffee) for full documentation.


## Installation via NPM

1. Install the **hubot-longtext** module as a Hubot dependency by running:

    ```
    npm install --save hubot-longtext
    ```

2. Enable the module by adding the **hubot-longtext** entry to your `external-scripts.json` file:

    ```json
    [
        "hubot-longtext"
    ]
    ```

3. Run your bot and see below for available config / commands


## Configuration

Variable | Default | Description
--- | --- | ---
`HUBOT_LONGTEXT_MAX` | 300 | Any message sent by Hubot that is longer than `HUBOT_LONGTEXT_MAX` string characters will be replaced with a link to the paste containing the message
`HUBOT_LONGTEXT_MAX_LINES` | false | Any message sent by Hubot with more than `HUBOT_LONGTEXT_MAX_LINES` string lines will be replaced with a link to the paste containing the message (disabled by default)
`HUBOT_LONGTEXT_SERVICE` | Dpaste | _(TBA)_


## Sample Interaction

```
user1>> hubot help
hubot>> http://dpaste.com/0TGWQ8T
```