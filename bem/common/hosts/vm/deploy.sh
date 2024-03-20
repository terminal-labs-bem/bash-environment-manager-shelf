export INSTALLUSER=$1
source .tmp/_commonenv.sh

sudo su $INSTALLUSER <<'EOF'
 source .tmp/_commonenv.sh
 vagrant up
 vagrant ssh --command "cd /vagrant; sudo bash .tmp/bem/common/install.sh vagrant"
EOF
