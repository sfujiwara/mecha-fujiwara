# mecha-fujiwara

<img src="data/icon.png" width=128px>

This is a chat bot created with the framework of [hubot].

[![Heroku Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

[hubot]: https://hubot.github.com/

## How to Use

### Set Environment Variables

For example, set required environment variables as below:

```sh
# export HUBOT_SLACK_TOKEN=XXXXX
export HUBOT_IDOBATA_API_TOKEN=XXXXX

export DOCOMO_API_KEY=XXXXX
export YAHOO_API_KEY=XXXXX
```
### Run Hubot

```sh
# ./bin/hubot
# ./bin/hubot --adapter slack
./bin/hubot --adapter idobata
```

## List of Commands

### Reply to Mention

The commands below run when hubot receives a mention as `<hubot-name> <command> <option>`.
Note that you have to set environment variables for some commands.

| command            | configuration    | description                                                         |
|:-------------------|:-----------------|:--------------------------------------------------------------------|
| `dd <message>`     | `DOCOMO_API_KEY` | reply using [docomo dialogue API] if any other command does not run |
| `memo <message>`   |                  | hubot remembers the message                                         |
| `memo`             |                  | hubot returns the message                                           |
| `morph`            | `DOCOMO_API_KEY` | hubot does morphological analysis                                   |
| `pn2bs <pokemon>`  |                  | hubot predicts base-stats and types from the name of pokemon        |
| `raincloud <area>` | `YAHOO_API_KEY`  | get the image of raincloud using [yahoo API]                        |
| `sh`               | -                | hubot runs shell script at `shell-scripts/<file-name>`              |
| `weather`          | -                | get the information of weather [weather hacks API]                  |
| `weblio <word>`    | -                | search the word at [weblio]                                         |

[docomo dialogue API]: https://dev.smt.docomo.ne.jp/?p=docs.api.page&api_name=dialogue&p_name=api_usage_scenario
[weather hacks API]: http://weather.livedoor.com/weather_hacks/webservice
[weblio]: http://ejje.weblio.jp/
[yahoo API]: http://developer.yahoo.co.jp/
