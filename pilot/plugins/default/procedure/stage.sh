export SIDE=$1
source .tmp/bem/library/env.sh

sudo su -m $USERNAME <<'EOF'
  source .tmp/bem/library/env.sh

  bash .tmp/bem/plugins/$PLUGIN/procedure/stages/setup_venv.sh
  bash .tmp/bem/plugins/$PLUGIN/procedure/stages/setup_venv_env.sh
  bash .tmp/bem/plugins/$PLUGIN/procedure/stages/setup_venv_app.sh
EOF

