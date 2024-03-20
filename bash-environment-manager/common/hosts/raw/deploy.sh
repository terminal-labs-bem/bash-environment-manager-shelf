export INSTALLUSER=$1
source .tmp/_commonenv.sh

FILE=/home/$INSTALLUSER/.tlcache/bem/$APPNAME/vars/hostaptdeps
if [ ! -f "$FILE" ]; then
    bash .tmp/bem/common/hosts/raw/pre_deploy_deps.sh
    touch $FILE
    chown $INSTALLUSER $FILE
fi

sudo bash .tmp/bem/pattern/superuser/setup.sh $INSTALLUSER
