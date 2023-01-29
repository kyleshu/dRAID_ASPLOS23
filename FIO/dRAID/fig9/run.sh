#!/bin/bash

username=$1
io_size=$2

if [[ "$io_size" == "4" ]]
then
  ../run_server_remote_nvme.sh $username raid5 100g 512 6 8
  sudo LD_PRELOAD=../spdk_bdev /usr/local/bin/fio ../raid5_read.conf -ioengine=../spdk_bdev -iodepth=28 -rw=randread -bs=4k -numjobs=8
  exit 0
fi

if [[ "$io_size" == "8" ]]
then
  ../run_server_remote_nvme.sh $username raid5 100g 512 6 8
  sudo LD_PRELOAD=../spdk_bdev /usr/local/bin/fio ../raid5_read.conf -ioengine=../spdk_bdev -iodepth=22 -rw=randread -bs=8k -numjobs=8
  exit 0
fi

if [[ "$io_size" == "16" ]]
then
  ../run_server_remote_nvme.sh $username raid5 100g 512 6 8
  sudo LD_PRELOAD=../spdk_bdev /usr/local/bin/fio ../raid5_read.conf -ioengine=../spdk_bdev -iodepth=12 -rw=randread -bs=16k -numjobs=8
  exit 0
fi

if [[ "$io_size" == "32" ]]
then
  ../run_server_remote_nvme.sh $username raid5 100g 512 6 2
  sudo LD_PRELOAD=../spdk_bdev /usr/local/bin/fio ../raid5_read.conf -ioengine=../spdk_bdev -iodepth=32 -rw=randread -bs=32k -numjobs=2
  exit 0
fi

if [[ "$io_size" == "64" ]]
then
  ../run_server_remote_nvme.sh $username raid5 100g 512 6 2
  sudo LD_PRELOAD=../spdk_bdev /usr/local/bin/fio ../raid5_read.conf -ioengine=../spdk_bdev -iodepth=24 -rw=randread -bs=64k -numjobs=2
  exit 0
fi

if [[ "$io_size" == "128" ]]
then
  ../run_server_remote_nvme.sh $username raid5 100g 512 6 2
  sudo LD_PRELOAD=../spdk_bdev /usr/local/bin/fio ../raid5_read.conf -ioengine=../spdk_bdev -iodepth=16 -rw=randread -bs=128k -numjobs=2
  exit 0
fi

echo "We do not have a pre-written command for this I/O size. Feel free to run your own command."