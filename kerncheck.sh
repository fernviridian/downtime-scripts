#! /bin/sh

#where $1 is your patched kernel version, or the first argument

#courtesy of benji

if [ -f check_kernel.output ] 
  then
  rm -rf check_kernel.output
fi

for box in `cat list`; do
  ssh $box uname -a | awk '{ print $3 }' > temp_kernel
  if [ "$1" != "`cat temp_kernel`" ] 
    then
     echo "$box did not get kernel patched, it is running `cat temp_kernel`" >> check_kernel.output
  fi
done

if [ -f check_kernel.output ] 
  then
  echo "Some boxen haven't been patched. Check check_kernel.output"

else
  echo "Everything was patched to kernel $1 successfully"

fi

