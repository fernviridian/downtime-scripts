#! /bin/bash

#stop reboot from a list
#courtesy of benji

while read host; do
   echo "stopping reboot on $host"
   ssh $host shutdown -c 
done < list

#old style, which is extremely slow if a host is not responding to pings or ssh (so basically useless)

#for i in `cat list`; do
#  ssh $i shutdown -c
#done
