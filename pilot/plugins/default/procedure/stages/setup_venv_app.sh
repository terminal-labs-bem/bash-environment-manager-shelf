source .tmp/_env.sh

source .tmp/bem/library/lib.sh

source /home/user/.tlcache/bem/bridgepilot/venv/bin/activate

if [[ -f "setup.py" ]];
then
  pip install -e .
else
  if [[ -d $APPNAME ]] && [[ ! -z $APPNAME ]];
  then
    cd $APPNAME
    pip install -e .
  fi
fi
