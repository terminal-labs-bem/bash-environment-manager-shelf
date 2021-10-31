apt update
apt install -y wget unzip
wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
bash bootstrap-salt.sh
wget https://raw.githubusercontent.com/terminal-labs/sample-states-installer/master/deploy-ubuntu.sh
sudo bash deploy-ubuntu.sh
