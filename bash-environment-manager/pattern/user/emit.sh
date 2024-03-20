export INSTALLUSER=$1
source .tmp/_commonenv.sh

echo "emitting"

bash .tmp/bem/pattern/user/emitters/emit_activate.sh $INSTALLUSER
