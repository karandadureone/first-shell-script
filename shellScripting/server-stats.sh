#!/bin/bash

##########################
#Author: KaranDadureOne
#Date: 14-June-2025
#Version: V1
#This Script will analyse basic server performance stats.
##########################

set -x
set -e
set -o pipefail

#Total CPU usage
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " 100 - $8 "%", "Idle: " $8 "%"}'

#Total memory usage (Free vs Used including percentage)
free -h
used=$(free | awk '/Mem:/ {print $3}')
total=$(free | awk '/Mem:/ {print $2}')
percent=$(awk "BEGIN {printf \"%.2f\", ($used/$total)*100}")
echo "Memory Used: $percent%"

#Total disk usage (Free vs Used including percentage)
df -h --total | grep total

#Top 5 processes by CPU usage
ps aux --sort=-%cpu | head -n 6

#Top 5 processes by memory usage
ps aux --sort=-%mem | head -n 6
