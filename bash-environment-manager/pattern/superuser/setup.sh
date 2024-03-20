export INSTALLUSER=$1
source .tmp/_commonenv.sh

mkdir -p /home/$INSTALLUSER/.tlcache/bem/$APPNAME
mkdir -p /home/$INSTALLUSER/.tlcache/bem/$APPNAME/vars
chown -R $INSTALLUSER $FILE /home/$INSTALLUSER/.tlcache

FILE=.repo/vars/noapt
if [ ! -f "$FILE" ]; then
    bash .tmp/bem/pattern/superuser/apt.sh
    touch $FILE
    chown $INSTALLUSER $FILE
fi

sudo su $INSTALLUSER <<'EOF'
  source .tmp/_commonenv.sh
  me="$(whoami)"
  bash .tmp/bem/pattern/user/stage.sh $me
  bash .tmp/bem/pattern/user/emit.sh $me
EOF
