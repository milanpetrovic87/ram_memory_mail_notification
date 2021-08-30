#!/bin/bash

ram=$(free -t | awk 'NR == 2 {print $3/$2*100}' | cut -c 1-2)

if [ $ram -ge 45 ]; then  # here you select your threshold
SUBJECT="ATTENTION : Utilization of RAM memory on $(hostname) at $(date)"
MESSAGE="/tmp/Mail.out"
TO="your_email@your_domain.com"

  echo "Current RAM utilization is: $ram%" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "The highest RAM consumers by top command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "$(top -b -o +%MEM | head -n 20)" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "The highest RAM consumers by ps command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "$(ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head)" >> $MESSAGE
  echo "$SUBJECT" | mail -s "Alert" -a "FROM:your_smtp@your_smtp.com" your_email@your_domain.com   < $MESSAGE
  rm /tmp/Mail.out
  fi

