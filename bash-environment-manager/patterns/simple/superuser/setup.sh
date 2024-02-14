export INSTALLUSER=$1
source .tmp/_commonenv.sh

FILE=".tmp/storage/data/patternaptdeps"
if [ ! -f "$FILE" ]; then
    bash .tmp/patterns/$PLUGIN/superuser/apt.sh
    touch $FILE
    chown $INSTALLUSER $FILE
fi

sudo su $INSTALLUSER <<'EOF'
  source .tmp/_commonenv.sh
  me="$(whoami)"
  bash .tmp/patterns/$PLUGIN/user/stage.sh $me
  bash .tmp/patterns/$PLUGIN/user/emit.sh $me
EOF
