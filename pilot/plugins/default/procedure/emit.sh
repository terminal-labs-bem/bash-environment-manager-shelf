export SIDE=$1
source .tmp/bem/library/env.sh

if [[ $MACHINE == "Linux" ]]; then
  cp .tmp/wget/bash-environment-manager-master/groups/configuration/basis/emitters/python-conda_full/activate_linux.sh activate.sh
elif [[ $MACHINE == "Mac" ]]
then
  cp .tmp/wget/bash-environment-manager-master/groups/configuration/basis/emitters/python-conda_full/conda/activate_mac.sh activate.sh
else
  echo "not implemented yet"
fi
