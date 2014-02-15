downtime-scripts
================

###scripts for automating downtime patching and reboots

First thing to do is to run the update script
`root@server ./ssh-update.sh`
This requires a list file where each line of the file is a FQDN hostname, and no other information. Should't be any comments or anything other and a list of hostnames. 

After all the ssh connections to boxen are finished, or like 30 minutes later, run the grab logs script
`root@server ./ssh-grab-logs.sh`

After this, there will be a updating-servers directory under the update directory, where each host has a file with it's fqdn and that file contains information from the updates.

###aftermath
review and then panic if things didn't work

Have fun and good luck with reboots. 
