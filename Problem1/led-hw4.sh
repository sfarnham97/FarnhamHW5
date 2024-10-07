#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.
#copied and modifed by Shawn Farnham on 9-30-2024
#now called led-hw4.sh
#if called, takes arguments on off flash status or blink
#if called with blink requires a number of blinks as a second argument
#e.g led-hw4.sh blink 3

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash or status  \n e.g. bashLED on "
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
elif [ "$1" == "blink" ]; then
  if [ $# == 2 ]; then
    removeTrigger
    #blink code
    i=$2
    while [ $i -gt 0 ]; do
      echo "1" >> "$LED3_PATH/brightness"
      sleep 1
      echo "0" >> "$LED3_PATH/brightness"
      sleep 1
      ((i--))
    done
  else #catch if not two arguments when blink is called
    echo "please enter blink followed by an int # of blinks"
    exit 1
  fi
fi
echo "End of the LED Bash Script"
