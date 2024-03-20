apt-mark hold 6.5.0-1016-azure

apt remove --purge dotnet-sdk-* -y
apt remove --purge dotnet-runtime-* -y
apt-get purge --auto-remove dotnet* -y

rm -rf /var/lib/update-manager
rm -rf /var/lib/update-notifier
rm -rf /var/lib/ubuntu-release-upgrader
apt-get purge --auto-remove ubuntu-advantage-tools -y

apt-get purge --auto-remove firefox firefox* -y

apt-get purge --auto-remove apache2 apache2* -y

apt remove podman vim vim-common vim-runtime vim-tiny  -y
apt remove vim* -y
apt-get purge --auto-remove vim -y
