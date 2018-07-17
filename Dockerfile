FROM node:latest

MAINTAINER shuhei.fujiwara@gmail.com

# Install hubot
RUN npm install -g yo generator-hubot
# Create user
RUN useradd -m hubot
# Change user and working directory
USER hubot
WORKDIR /home/hubot
# Create hubot
RUN yo hubot --owner "sfujiwara" \
             --name "mecha-fujiwara" \
             --description "He is a nice guy" \
             --adapter slack
# Add scripts directory
ADD scripts/ scripts/
# Install kuromoji.js
RUN npm install --save kuromoji
# Run hubot
CMD ./bin/hubot --adapter slack
