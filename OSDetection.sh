#!/bin/bash

file=$1

while read line
	do
		ping -c 1 $line >/dev/null

	done <$file


