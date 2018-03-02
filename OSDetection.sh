#!/bin/bash

file=$1

while read line
	do
		longTTL=$( ping -c 1 $line | grep ttl | cut -d " " -f6 )
		shortTTL=$( echo $longTTL | cut -d "=" -f2 )
#		echo "$longTTL"
#		echo "$shortTT"
		if  [ $shortTTL == 64 ]
		then
			echo "$line is a Linux OS."
		elif [ $shortTTL == 128 ]
		then
			echo "$line is a Windows OS."
		else
			echo "$line is an unkown OS."
		fi

	done <$file


