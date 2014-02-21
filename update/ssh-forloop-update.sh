#! /bin/sh
rm -rf updating-servers
mkdir updating-servers

for host in `cat list`; do
  touch updating-servers/$host
  echo "sshing to $host" > updating-servers/$host
  ssh $host bash -s < ./update.sh
  echo "was able to ssh to $host" >> updating-servers/$host
done
