apt remove --purge dotnet-sdk-* -y
apt remove --purge dotnet-runtime-* -y
apt-get purge --auto-remove dotnet* -y

rm -rf /var/lib/update-manager
rm -rf /var/lib/update-notifier
rm -rf /var/lib/ubuntu-release-upgrader
apt-get purge --auto-remove ubuntu-advantage-tools -y

apt remove firefox -y
apt-get purge --auto-remove firefox -y

apt remove apache2 -y
apt remove apache2* -y
apt-get purge --auto-remove apache2 -y

apt remove podman vim vim-common vim-runtime vim-tiny  -y
apt remove vim* -y
apt-get purge --auto-remove vim -y

apt-get purge --auto-remove 6.5.0-1016-azure -y

apt-get purge --auto-remove linux-cloud-tools-common -y
apt-get purge --auto-remove linux-tools-common -y

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
