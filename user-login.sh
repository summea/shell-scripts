#!/bin/sh
#
# user-login.sh
#
# A simple script to automatically log in users to a given program
# using usernames and passwords on corresponding computers.
#
# Note: Script made for Mac OS X because of the osascript calls.
#
# Setup: Make sure to type in the usernames, passwords, and
#        computer names in the array variables below, like this:
#
#            usernames=(usera userb userc)
#
#        before running the script.
#

usernames=() 
passwords=()
computers=()
all_same_password=false

i=0
for c in "${computers[@]}"
do
  hostname=`hostname | cut -d '.' -f 1`
  if [ "$c" == "$hostname" ]
  then
    `osascript -e 'tell application "System Events" to keystroke "'${usernames[$i]}'"'`
    `osascript -e 'tell application "System Events" to keystroke tab'`
    `osascript -e 'tell application "System Events" to delay 0.5'`
    if [ $all_same_password ]
    then
      `osascript -e 'tell application "System Events" to keystroke "'${passwords[0]}'"'`
    else
      `osascript -e 'tell application "System Events" to keystroke "'${passwords[$i]}'"'`
    fi
    `osascript -e 'tell application "System Events" to delay 0.5'`
    `osascript -e 'tell application "System Events" to keystroke return'`
  fi
  i=$i+1
done
