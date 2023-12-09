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

mkdir -p /home/vagrant/.ssh
ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -P ""
chmod 700 /home/vagrant/.ssh
chmod 644 /home/vagrant/.ssh/id_rsa.pub
chmod 600 /home/vagrant/.ssh/id_rsa
chown -R vagrant /home/vagrant/.ssh

echo -e vagrant ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers
