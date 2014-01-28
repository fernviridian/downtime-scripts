#! /bin/bash

#reboot computers from a list
#courtesy of benji

for i in `cat list`; do
  ssh $i shutdown -r +5 "This computer is rebooting in 5 minutes. Please save your work and log out. Thanks for flying pdxcat." &
done

#while read host; do
#   echo "rebooting $host"
#   ssh $host shutdown -r +5 "This computer is rebooting in 5 minutes. Please save your work and log out. Thanks for flying pdxcat." &
#done < list
