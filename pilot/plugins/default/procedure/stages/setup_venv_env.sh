source .tmp/_env.sh
FILE=.tmp/_followenv.sh
if test -f "$FILE"; then
source .tmp/_followenv.sh
fi

source /home/user/.tlcache/bem/bridgepilot/venv/bin/activate

pip install --upgrade pip
pip install --upgrade setuptools

pip install pyyaml