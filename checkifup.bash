#! /bin/bash

#courtesy of benji
#checks uptimes of boxes and sends output to checkifup.output

#check if previous ouput file is there, and if so, remove it
if [ -f checkifup.output ] 
  then
  rm -rf checkifup.output
fi

#start loopin'

for i in `cat list`; do 
    #ping to check if the host is up
    ping -c 3 $i > /dev/null 2>&1
        if [ "$?" -ne "0" ]; then
            echo "$i was unreachable"
	    echo "$i was unreachable" >> checkifup.output
	    printf "\n" >>checkifup.output
	    continue
        fi
	
	#check if ssh's
	#nc $i 22
	#if [ "$?" -ne "0" ]; then	
	#    echo "$i didn't ssh" >> checkifup.output
	#    printf "\n" >>checkifup.output
	#    continue
	#fi

	echo "Ssh'ing into $i" >> checkifup.output
	echo "Uptime information:" >> checkifup.output
	ssh $i uptime >> checkifup.output
	printf "\n" >> checkifup.output
	echo "$i is up."
done
