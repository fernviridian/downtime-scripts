#! /bin/sh
rm -rf updating-servers
mkdir updating-servers

while read host; do
   touch updating-servers/$host
   echo "sshing to $host" > updating-servers/$host
   ssh  $host bash -s < ./update.sh &
   echo "Was able to ssh to $host" >> updating-servers/$host
  
done < list

