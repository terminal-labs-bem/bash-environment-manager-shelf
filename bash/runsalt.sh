if test -d "saltstack";then \
  APPNAME=sdm
  PYTHONVERSION=3.6.9
  DPENAME=dpe
  USERNAME=vagrant
  chown -R ${USERNAME} /home/${USERNAME}/${DPENAME}
  chmod -R 777 /home/${USERNAME}/${DPENAME}
  chown -R ${USERNAME} /vagrant
  chmod -R 777 /vagrant

  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}

  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/bin:$PATH
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/lastpass-cli/build:$PATH

  export NVM_DIR=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm
  export USE_GIT_URI="true"
  source /home/${USERNAME}/.bashrc
  source /home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm/nvm.sh
  source activate ${APPNAME}

  export DEESCALATED_SALT_CONFIG_DIR=/vagrant/saltstack/configs
  export DEESCALATED_SALT_ROOT_DIR=/vagrant/saltstack/states
  export DEESCALATED_SALT_LOG_FILE=/vagrant/saltstack/logs/logs

  salt-call \
     --config-dir=$DEESCALATED_SALT_CONFIG_DIR \
     --log-file=$DEESCALATED_SALT_LOG_FILE \
     --file-root=$DEESCALATED_SALT_ROOT_DIR \
     --log-level=info \
     --state-output=terse \
     --local state.highstate
fi
