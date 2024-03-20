export INSTALLUSER=$1
source .tmp/_commonenv.sh

echo "emitting"

source /home/$INSTALLUSER/.tlcache/bem/$APPNAME/venv/bin/activate

bash .tmp/bem/common/pattern/user/emitters/emit_activate.sh $INSTALLUSER
