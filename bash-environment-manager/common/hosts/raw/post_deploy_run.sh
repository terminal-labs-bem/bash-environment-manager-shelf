export INSTALLUSER=$1
source .tmp/_commonenv.sh

sudo su $INSTALLUSER <<'EOF'
 source .tmp/_commonenv.sh
 bash .tmp/bem/pattern/user/run.sh user
EOF
