#! /bin/sh
if [ -f update-errors.log ] ; then
	rm -rf update-errors.log
fi

while read host; do
    echo "Grabbing log from $host"
    scp $host:/root/ssh-update-log updating-servers/$host.log
    echo "" >> updating-servers/$host
    echo "" >> updating-servers/$host
    echo "" >> updating-servers/$host
    echo "LOG follows below:" >> updating-servers/$host
    cat updating-servers/$host.log >> updating-servers/$host
    rm updating-servers/$host.log
    ssh $host bash -s < iferror.sh >> update-errors.log
	#>> updating-servers/$host.error

done < list

