#! /bin/sh

while read host; do
   echo "cleankerning $host" >> updating-servers/$host
   ssh  $host bash -s < ./kernklean.sh &
   echo "Was able to ssh to $host for cleankerning" >> updating-servers/$host
  
done < list

