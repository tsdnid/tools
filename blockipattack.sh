#!/bin/bash
cat /web/ip.list | while read line
do
	ip=$(echo $line)
	csf -d $ip
#	imunify360-agent blacklist ip add $ip --scope group
done
