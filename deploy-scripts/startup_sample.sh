apt-get -y update
apt-get -y upgrade
apt-get -y install git
apt-get -y install nodejs-legacy npm
cd /
git clone https://github.com/sfujiwara/mecha-fujiwara.git
cd mecha-fujiwara
export HUBOT_SLACK_TOKEN="XXXXX"
export DOCOMO_API_KEY="XXXXX"
export YAHOO_API_KEY="XXXXX"
nohup ./bin/hubot --adapter slack &
