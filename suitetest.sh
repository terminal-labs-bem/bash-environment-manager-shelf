mkdir -p .tmp
mkdir -p .tmp/storage
mkdir -p .tmp/storage/repo

cd .tmp/storage/repo

git clone git@github.com:terminal-labs-bem/lowkit.git
git clone git@github.com:terminal-labs-bem/highkit.git
git clone git@github.com:terminal-labs-bem/factory.git



cd highkit
sudo make vm.venv.python
vagrant destroy -f
cd ..
