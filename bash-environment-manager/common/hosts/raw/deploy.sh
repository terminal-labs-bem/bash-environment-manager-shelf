export INSTALLUSER=$1
source .tmp/_commonenv.sh

FILE=.repo/vars/noapt
if [ ! -f "$FILE" ]; then
    bash .tmp/bem/common/hosts/raw/pre_deploy_deps.sh $INSTALLUSER
    touch $FILE
    chown $INSTALLUSER $FILE
fi

sudo bash .tmp/bem/pattern/superuser/setup.sh $INSTALLUSER

FILE=.repo/vars/norun
if [ ! -f "$FILE" ]; then
    bash .tmp/bem/common/hosts/raw/post_deploy_run.sh $INSTALLUSER
    touch $FILE
    chown $INSTALLUSER $FILE
fi
