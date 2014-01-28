#! /bin/bash

#stop reboot from a list
#courtesy of benji

for i in `cat list`; do
  ssh $i shutdown -c
done
