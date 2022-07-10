#!/bin/bash
# how to use ?
# run this command
# magickdel.sh $username
# magickdel.sh hilmi
# magickdel.sh dzub

find /home/$1*/.cagefs/tmp -type f -name 'magick-*' -delete
