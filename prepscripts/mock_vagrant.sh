adduser --disabled-password --gecos "" vagrant
touch /home/vagrant/.bashrc
usermod -aG sudo vagrant

mkdir -p /vagrant
cp -a . /vagrant/
chmod 777 -R /vagrant
chown -R vagrant /vagrant

mkdir -p /home/vagrant
chmod 777 -R /home/vagrant
chown -R vagrant /home/vagrant

mkdir -p /home/vagant/.ssh
chmod 777 -R /home/vagant/.ssh
chown -R vagrant /home/vagant/.ssh

echo -e vagrant ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers
