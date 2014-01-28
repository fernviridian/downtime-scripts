#!/bin/sh
	export TERM=xterm
        if [ -f /root/error ] ; then
            echo "`hostname` has errored"   
	fi
