export INSTALLUSER=$1
source .tmp/_commonenv.sh

echo "staging"

bash .tmp/bem/common/pattern/user/stagers/setup_venv.sh $INSTALLUSER
bash .tmp/bem/common/pattern/user/stagers/setup_venv_env.sh $INSTALLUSER
bash .tmp/bem/common/pattern/user/stagers/setup_venv_app.sh $INSTALLUSER
