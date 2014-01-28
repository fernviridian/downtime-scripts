#! /bin/sh

for server in `cat list`; do
	ping -c 3 $server >> pingcheck.log
done


echo "DONEDONEDONEONDONEONDDONEDONDONE"
