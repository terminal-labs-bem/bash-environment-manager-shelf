export APPNAME=$1
export SUDOUSERNAME=$2
export CONFIGURATION=$3
export TYPE=$4
export PYTHONVERSION=$5
export HOSTTYPE=$6
export INTERNALUSER=$7
export PLATFORM=$8

source .tmp/bem/library/lib.sh

getmachine
getuserhome

emit_internal_env_file

edit_internal_env_file "-bemdebug-" "true"
edit_internal_env_file "-appname-" $APPNAME
edit_internal_env_file "-platform-" $PLATFORM
edit_internal_env_file "-type-" $TYPE
edit_internal_env_file "-cmd-" $CONFIGURATION
edit_internal_env_file "-pythonversion-" $PYTHONVERSION
edit_internal_env_file "-dpename-" "dpe"
edit_internal_env_file "-wd-" $(pwd)
edit_internal_env_file "-user-" $INTERNALUSER
edit_internal_env_file "-home-" /home/$INTERNALUSER
edit_internal_env_file "-username-" $INTERNALUSER
edit_internal_env_file "-userhome-" /home/$INTERNALUSER
edit_internal_env_file "-internaluser-" $INTERNALUSER
edit_internal_env_file "-internalusername-" $INTERNALUSER
edit_internal_env_file "-internaluserhome-" /home/$INTERNALUSER
edit_internal_env_file "-machine-" $MACHINE