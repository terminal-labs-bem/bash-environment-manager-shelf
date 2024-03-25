DEBIAN_FRONTEND=noninteractive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
sudo apt-get install -y -q

if [  -n "$(uname -a | grep Ubuntu)" ]; then
	apt-get update
	apt-get install software-properties-common -y
	add-apt-repository ppa:deadsnakes/ppa -y
else
    apt-get update
fi 

apt-get update
apt-get install python3.11 -y
apt-get install python3.11-venv -y
