export INSTALLUSER=$1
source .tmp/_commonenv.sh

source "$HOME/.rye/env"
rye sync
