downtime-scripts
================

###scripts for automating downtime patching and reboots


###Update hosts
First thing to do is to run the update script:

Run the scripts from their the parent directory.
```
cd downtime-scripts
root@server ~/downtime-scripts/
cd update
root@server ./ssh-update.sh
```

This requires a list file where each line of the file is a fqdn (fully qualified domain name eg, someserver.google.com) hostname, and no other information. There should not be any comments or anything other and a list of hostnames. 
This also assumes you have ssh keys on each host in the file and an ssh-agent running or a passphrase-less ssh key, and you are running the scripts from that host.

This will concurently ssh to all the hosts in the file and start patching based on if the host is debian-like or centos-like and run the proper update commands.

It will make a directory called updating-servers and touch files for each host based on fqdn.

###Grab logs
After all the ssh connections to boxen are finished, run the grab logs script

`root@server ./ssh-grab-logs.sh`

While `ssh-update.sh` is running it will log all stdout to a file in `/root/ssh-update-log`.
The `ssh-grab-logs.sh` script will collect those logs from each host and put them in the fqdn files created earlier with each hostname.

###When you're ready to reboot:

`root@server ./rebootboxen.bash`

This will send reboot codes to all hosts in the list and they will shutdown in 5 minutes, with the message accordingly.

###Utilize the check scripts

The most useful is probably the checkifup.bash script. This will attempt to ping a host, and if it pings, check ssh. It records all output to a checkifup.output for review at a later time. If the host ssh's then it will run uptime which will give you an idea if the host rebooted, or for some reason it didn't then you can just do it manually. 

There are other scripts for checking hosts during and after reboots, see each scripts source.

###Success!

So reboots went great, right......right?

![](http://www.quickmeme.com/img/32/32f42e59792d736f15e2ef8d38271f358e834c6a034e329400a3962d5bb84333.jpg)

