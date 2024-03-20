export INSTALLUSER=$1
source .tmp/_commonenv.sh

source /home/$INSTALLUSER/.tlcache/bem/$APPNAME/venv/bin/activate

bash .tmp/bem/common/pattern/user/runners/run_version.sh $INSTALLUSER
bash .tmp/bem/common/pattern/user/runners/run_black.sh $INSTALLUSER
bash .tmp/bem/common/pattern/user/runners/run_tests.sh $INSTALLUSER
