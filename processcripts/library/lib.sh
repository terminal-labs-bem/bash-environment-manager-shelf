mkdir -p .tmp

emit_external_env_file () {
cat > .tmp/_externalenv.sh <<EOF
export BEM_DEBUG=-bemdebug-
export USER=-user-
export HOME=-home-
export USERNAME=-username-
export USERHOME=-userhome-
export INTERNALUSER=-internaluser-
export INTERNALUSERNAME=-internalusername-
export INTERNALUSERHOME=-internaluserhome-
export APPNAME=-appname-
export PYTHONVERSION=-pythonversion-
export PLATFORM=-platform-
export TYPE=-type-
export CMD=-cmd-
export DPENAME=-dpename-
export MACHINE=-machine-
export WD=-wd-
EOF
}

emit_internal_env_file () {
cat > .tmp/_internalenv.sh <<EOF
export BEM_DEBUG=-bemdebug-
export USER=-user-
export HOME=-home-
export USERNAME=-username-
export USERHOME=-userhome-
export INTERNALUSER=-internaluser-
export INTERNALUSERNAME=-internalusername-
export INTERNALUSERHOME=-internaluserhome-
export APPNAME=-appname-
export PYTHONVERSION=-pythonversion-
export PLATFORM=-platform-
export TYPE=-type-
export CMD=-cmd-
export DPENAME=-dpename-
export MACHINE=-machine-
export WD=-wd-
EOF
}

getmachine () {
  unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)     machine=Linux;;
      Darwin*)    machine=Mac;;
      CYGWIN*)    machine=Cygwin;;
      MINGW*)     machine=MinGw;;
      *)          machine="UNKNOWN:${unameOut}"
  esac
  MACHINE=$machine
}

getuserhome () {
  if [[ $MACHINE == "Mac" ]]; then
    USERHOME=/Users/$USERNAME
  else
    USERHOME=/home/$USERNAME
  fi
}

clone_repo () {
  mkdir -p .tmp/repos
  cd .tmp/repos
  git clone ${1}
  cd ../..
}

install_project_repo_pip () {
  mkdir -p .tmp/repos
  cd .tmp/repos

  path=${1}
  fullname="${path##*/}"
  dirname="${path%/*}"
  basename="${fullname%.*}"
  extension="${fullname##*.}"

  cd ${basename}
  pip install -e .
  cd ../../..
}

edit_external_env_file () {
  sed "s#$1#\"$2\"#g" .tmp/_externalenv.sh > .tmp/_externalenv.tmp
  rm .tmp/_externalenv.sh
  mv .tmp/_externalenv.tmp .tmp/_externalenv.sh
  cp .tmp/_externalenv.sh .tmp/_env.sh
}

edit_internal_env_file () {
  sed "s#$1#\"$2\"#g" .tmp/_internalenv.sh > .tmp/_internalenv.tmp
  rm .tmp/_internalenv.sh
  mv .tmp/_internalenv.tmp .tmp/_internalenv.sh
}
