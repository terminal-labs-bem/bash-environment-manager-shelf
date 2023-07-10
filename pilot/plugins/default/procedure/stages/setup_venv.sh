source .tmp/_env.sh
FILE=.tmp/_followenv.sh
if test -f "$FILE"; then
  source .tmp/_followenv.sh
fi

sudo su -m $USERNAME <<'EOF'
 	source .tmp/_env.sh
	FILE=.tmp/_followenv.sh
	if test -f "$FILE"; then
	source .tmp/_followenv.sh
	fi
	/usr/bin/python3.11 -m venv /home/user/.tlcache/bem/bridgepilot/venv
EOF