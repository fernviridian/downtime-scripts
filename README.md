downtime-scripts
================

scripts for automating downtime patching and reboots
#instructions by benji
#written 12/16/13

#first thing to do is to run the update script
ssh-update.sh

#then after all the ssh connections to boxen are finished, or like 30 minutes later, run the grab logs script
ssh-grab-logs.sh

#then
check update-errors.log to see if anything went wrong

#aftermath
review and then panic if things didn't work


#cleankernin fer debian
#
run cleankern.sh and watch the world burn

