#!/bin/sh
   	export TERM=xterm
        if [ -f /etc/debian_version ] ; then
            #do ubuntu / debian things
	    /root/bin/cleankern
        fi

