export APPNAME=$1
export SUDOUSERNAME=$2
export CONFIGURATION=$3
export TYPE=$4
export PYTHONVERSION=$5
export HOSTTYPE=$6
export INTERNALUSER=$7
export PLATFORM=$8

mkdir -p .tmp/storage

cd .tmp/storage
mkdir -p download
mkdir -p unzipped
mkdir -p artifact
mkdir -p scratch
mkdir -p script
mkdir -p clone
mkdir -p auth
mkdir -p data
mkdir -p bin