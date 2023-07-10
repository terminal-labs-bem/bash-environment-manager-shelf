export SIDE=$1
source .tmp/bem/library/env.sh

sudo su -m $USERNAME <<'EOF'
  source .tmp/bem/library/env.sh
  bash .tmp/bem/plugins/$PLUGIN/procedure/stage.sh
EOF