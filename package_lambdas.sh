#!/usr/bin/env bash

# This script copies the lambdas into a bin directory, installs requirements, then zips the lambdas

SRC_DIR="lambdas"
BUILD_DIR="bin"

mkdir -p ${BUILD_DIR}/lambdas | true
rm -rf ${BUILD_DIR}/*.zip | true
cp -r ${SRC_DIR}/* ${BUILD_DIR}/lambdas


#The sed is a bit complicated to be osx / linux cross compatible :( .//run.sh vs ./run.sh
cd ${BUILD_DIR}/lambdas && for LAMBDA in $(find ./  '.*[^_].py' |  sed  's/\/\//\//g' | awk -F "/" '{print $2}' | sort |uniq | grep -v .py); do
        if [ -f $i/requirements.txt ]; then
           echo "Installing requirements"
           pip install -r $i/requirements.txt -t $i/
        fi

        cd ${LAMBDA} && zip -r ${LAMBDA}.zip *  > /dev/null && mv ${LAMBDA}.zip ../../ && cd ../
    done

cd ../
