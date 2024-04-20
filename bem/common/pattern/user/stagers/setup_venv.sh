export INSTALLUSER=$1
source .tmp/_commonenv.sh

source "$HOME/.cargo/env"
source "$HOME/.rye/env"
rye sync
