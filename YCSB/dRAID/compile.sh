#!/bin/bash

branch=$1
spdk_dir=../draid-spdk

# compile mkfs
cd ~/dRAID/YCSB/dRAID
make mkfs

# prepare for YCSB
cd ~
mkdir -p data

cd ~/rocksdb
git checkout $1 
if [[ "$1" == "rocksdb" ]]
then
    cp ${spdk_dir}/lib/rocksdb/env_spdk_rocksdb.cc SPDK_DIR/lib/rocksdb/env_spdk.cc
elif [[ "$1" == "objstore" ]]
then
    cp ${spdk_dir}/lib/rocksdb/env_spdk_objstore.cc SPDK_DIR/lib/rocksdb/env_spdk.cc
fi

sudo make -j8 install-shared SPDK_DIR=$spdk_dir
sudo ldconfig
cd ycsb
mkdir -p build
cd build
cmake ../
make -j
