export INSTALLUSER=$1
source .tmp/_commonenv.sh

source .venv/bin/activate

pytest
