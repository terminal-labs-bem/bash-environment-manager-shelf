export SIDE=$1

if [[ $SIDE == "external" ]]; then
     source .tmp/_externalenv.sh
     cp .tmp/_externalenv.sh .tmp/_env.sh
elif [[ $SIDE == "internal" ]]; then
     source .tmp/_internalenv.sh
     cp .tmp/_internalenv.sh .tmp/_env.sh
fi

chown -R user:user .tmp
chmod -R 777 .tmp

sudo su -m $USERNAME <<'EOF'
  source .tmp/_env.sh
  vagrant up
  vagrant ssh --command "cd /vagrant; sudo bash .tmp/bem/plugins/psf/hosts/vagrant/packages/apt.sh; sudo bash .tmp/bem/plugins/psf/procedure/stage.sh internal"
EOF
