mkdir -p .tmp
mkdir -p .tmp/storage
mkdir -p .tmp/storage/repo

cd .tmp/storage/repo

git clone git@github.com:terminal-labs-bem/factory.git

cd factory
sudo make vm.venv.python
cd ..
