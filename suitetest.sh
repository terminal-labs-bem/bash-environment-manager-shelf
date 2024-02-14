mkdir -p .tmp
mkdir -p .tmp/storage
mkdir -p .tmp/storage/repo

cd .tmp/storage/repo

git clone git@github.com:terminal-labs-bem/kit_simple.git
git clone git@github.com:terminal-labs-bem/kit_standard.git
git clone git@github.com:terminal-labs-bem/factory_standard.git

cd kit_simple
sudo make venv.python
cd ..

cd kit_standard
sudo make venv.python
cd ..

cd factory_standard
sudo make venv.python
cd ..
