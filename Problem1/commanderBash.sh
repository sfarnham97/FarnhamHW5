#!/bin/bash
# commanderBash.sh
#This script will manipulate led-hw4.sh from last homework
#This script required led-hw4.sh to be in the same dir
#note: several sleeps where added to show it working in human times
#
# made by Shawn Farnham on 10-7-2024

#turning led on then waiting 2 sec
echo "turning LED on --------------------"
./led-hw4.sh on
sleep 2

#turning LED off then waiting 2 sec
echo "turning LED off --------------------"
./led-hw4.sh off
sleep 2

#check status
echo "check status ---------------------"
./led-hw4.sh status

#Flash the LED for 3 seconds
echo "flashing the LED -------------------"
./led-hw4.sh flash
sleep 3

#Blink the LED 3 times
echo "blink the LED 3 times ------------------------"
./led-hw4.sh blink 3

