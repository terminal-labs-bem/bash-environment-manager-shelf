mkdir -p .tmp
mkdir -p .tmp/storage
mkdir -p .tmp/storage/repo

cd .tmp/storage/repo

git clone git@github.com:terminal-labs-bem/lowkit.git
git clone git@github.com:terminal-labs-bem/highkit.git
git clone git@github.com:terminal-labs-bem/factory.git

cd lowkit
sudo make venv.python
cd ..

cd highkit
sudo make venv.python
cd ..

cd factory
sudo make venv.python
cd ..
