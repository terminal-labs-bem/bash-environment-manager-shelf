apt update
apt install -y wget unzip
wget https://raw.githubusercontent.com/terminal-labs/sample-states-installer/master/saltify-deploy-ubuntu.sh
bash saltify-deploy-ubuntu.sh
cd saltstack
cp -r states/* /srv/salt
cp grains/grains /etc/salt/grains
salt-call --local state.highstate --log-level info
