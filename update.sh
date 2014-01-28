#!/bin/sh
   	export TERM=xterm
	if [ -f /root/error ] ; then
	    rm -rf /root/error
	fi	

        if [ -f /etc/redhat-release ] ; then
            #do redhat / centos things with yum
            yum upgrade -y > /root/ssh-update-log
	    if [ $? -ne 0 ] ; then
               touch /root/error
	       echo "$?" >  /root/error
            fi
        elif [ -f /etc/debian_version ] ; then
            #do ubuntu / debian things
            apt-get update -y > /root/ssh-update-log
	    if [ $? -ne 0 ] ; then
               touch /root/error
               echo "$?" >  /root/error
            fi
            apt-get dist-upgrade -y >> /root/ssh-update-log
	    if [ $? -ne 0 ] ; then
               touch /root/error
               echo "$?" >  /root/error
            fi
        fi

