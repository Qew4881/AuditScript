#!/bin/bash

file=$1		#Read in command line argument

while read line		#Loop to read in file of pings
	do		#then shorten it to just the TTL number.
		longTTL=$( ping -c 1 $line | grep ttl | cut -d " " -f6 )
		shortTTL=$( echo $longTTL | cut -d "=" -f2 )
#		echo "$longTTL"
#		echo "$shortTTL"
		if [ -z "$shortTTL" ]	#Logic to determine OS or unreachable
		then 
			echo "$line is an unreachable device."
		elif [ $shortTTL == 64 ]
		then
			echo "$line is a Linux OS."
		elif [ $shortTTL == 128 ]
		then
			echo "$line is a Windows OS."
		elif [ $shortTTL == 255 ]
		then
			echo "$line is a FreeBSD OS."
		fi

	done <$file


