mkdir -p /home/user/.tlcache
mkdir -p /home/user/.tlcache/task
mkdir -p /home/user/.tlcache/task/app

/usr/bin/python3.11 -m venv /home/user/.tlcache/task/app/venv

source /home/user/.tlcache/task/app/venv/bin/activate

pip install --upgrade pip
pip install --upgrade setuptools

pip install poetry
pip install pyyaml
pip install poetry2setup

source /home/user/.tlcache/task/app/venv/bin/activate
export XDG_CONFIG_HOME="$HOME/.config"
poetry install
