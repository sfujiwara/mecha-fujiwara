# mecha-fujiwara

<img src="data/icon.png" width=128px>

This is a chat bot created with the framework of [hubot].

[hubot]: https://hubot.github.com/

## Requirements

- Docker
- Google Cloud SDK (optional)

## How to Use

### Build Docker image

```bash
docker build -t mecha-fujiwara .
```

### Set Environment Variables

Create and edit `.env` file.
You can set environment variables like [`.env_sample`](.env_sample).

### Run on Local

```bash

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
