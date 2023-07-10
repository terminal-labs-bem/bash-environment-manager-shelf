export APPNAME=${1}
export SUDOUSERNAME=${2}
export CONFIGURATION=${3}
export TYPE=${4}
export PYTHONVERSION=${5}
export HOSTTYPE=${6}
export INTERNALUSER=${7}
export PLATFORM=${8}
export PLUGIN=${9}
export EXTRA=${10}

source .tmp/bem/library/lib.sh

su -m $SUDOUSERNAME <<'EOF'
 bash .tmp/bem/helpers/setup_tmp.sh $APPNAME $SUDOUSERNAME $CONFIGURATION $TYPE $PYTHONVERSION $HOSTTYPE $INTERNALUSER $PLATFORM $PLUGIN $EXTRA
EOF

bash .tmp/bem/helpers/setup_vars_external.sh $APPNAME $SUDOUSERNAME $CONFIGURATION $TYPE $PYTHONVERSION $HOSTTYPE $INTERNALUSER $PLATFORM $PLUGIN $EXTRA
bash .tmp/bem/helpers/setup_vars_internal.sh $APPNAME $SUDOUSERNAME $CONFIGURATION $TYPE $PYTHONVERSION $HOSTTYPE $INTERNALUSER $PLATFORM $PLUGIN $EXTRA

if [[ $HOSTTYPE == "host" ]]; then
  bash .tmp/bem/plugins/$PLUGIN/hosts/standard/deploy.sh external
fi

if [[ $HOSTTYPE == "vagrant" ]]; then
  bash .tmp/bem/plugins/$PLUGIN/hosts/vagrant/deploy.sh external
fi