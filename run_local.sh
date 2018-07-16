docker run --rm \
           -it \
           -v $(pwd)/scripts:/home/hubot/scripts \
           --env-file .env mecha-fujiwara \
           ./bin/hubot
