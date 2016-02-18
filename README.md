# mecha-fujiwara

<img src="data/icon.png" width=128px>

This is a chat bot created with the framework of [hubot].

[hubot]: https://hubot.github.com/

## List of Commands

### Reply to Mention

The commands below run when hubot receives a mention as `<hubot-name> <command> <option>`.
Note that you have to set environment variables for some commands.

| command            | configuration    | description |
|:-------------------|:-----------------|:------------|
| `raincloud <area>` | `YAHOO_API_KEY`  | get the image of raincloud using [yahoo API]|
| `weather`          | -                | get the information of weather [weather hacks API] |
| `weblio` <word>    | -                | search the word at [weblio] |
| otherwise called   | `DOCOMO_API_KEY` | reply using [docomo dialogue API] if any other command does not run |

[docomo dialogue API]: https://dev.smt.docomo.ne.jp/?p=docs.api.page&api_name=dialogue&p_name=api_usage_scenario
[weather hacks API]: http://weather.livedoor.com/weather_hacks/webservice
[weblio]: http://ejje.weblio.jp/
[yahoo API]: http://developer.yahoo.co.jp/

### Other Features

| run if             | configuration    | description |
|:-------------------|:-----------------|:------------|
| you say palindrome | -                | hubot find it |