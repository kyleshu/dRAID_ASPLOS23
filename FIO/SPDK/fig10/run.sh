#!/bin/bash

io_size=$1

if [[ "$io_size" == "4" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=44 -rw=randwrite -bs=4k -numjobs=2 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "8" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=48 -rw=randwrite -bs=8k -numjobs=2 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "16" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=32 -rw=randwrite -bs=16k -numjobs=2 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "32" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=20 -rw=randwrite -bs=32k -numjobs=2 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "64" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=15 -rw=randwrite -bs=64k -numjobs=2 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "128" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=10 -rw=randwrite -bs=128k -numjobs=2 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "256" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=4 -rw=randwrite -bs=256k -numjobs=4 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "512" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=3 -rw=randwrite -bs=512k -numjobs=4 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "1024" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=4 -rw=randwrite -bs=1024k -numjobs=2 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "2048" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=5 -rw=randwrite -bs=2048k -numjobs=2 ./raid5_spdk.conf
  exit 0
fi

if [[ "$io_size" == "3584" ]]
then
  sudo LD_PRELOAD=../../../../spdk/build/fio/spdk_bdev /usr/local/bin/fio -iodepth=2 -rw=randwrite -bs=3584k -numjobs=4 ./raid5_spdk.conf
  exit 0
fi

echo "We do not have a pre-written command for this I/O size. Feel free to run your own command."