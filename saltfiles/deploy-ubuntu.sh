apt install -y wget unzip

mkdir -p /var/tmp/saltstack-cookiecutter

cd /var/tmp/saltstack-cookiecutter

wget https://github.com/terminal-labs/sample-states/archive/testing.zip
unzip testing.zip
mv sample-states-testing sample-states

wget https://raw.githubusercontent.com/terminal-labs/saltstack-cookiecutter/master/master
wget https://raw.githubusercontent.com/terminal-labs/saltstack-cookiecutter/master/minion

mkdir -p /srv
mkdir -p /srv/pillar
mkdir -p /srv/salt
mkdir -p /srv/salt/_proxy
mkdir -p /srv/salt/_modules
mkdir -p /srv/salt/_grains

mkdir -p /etc/salt
mkdir -p /etc/salt/pki
mkdir -p /etc/salt/pki/minion

cp master /etc/salt/master
cp minion /etc/salt/minion

cp -r sample-states/saltstack/states/* /srv/salt

rm -rf /var/tmp/saltstack-cookiecutter
