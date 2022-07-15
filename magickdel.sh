#!/bin/bash
# how to use ?
# run this command
# magickdel.sh $username
# magickdel.sh hilmi
# magickdel.sh dzub

printf "\n There is some Magick file on $1 \n \n"
ls -lah /home/$1/.cagefs/tmp/

find /home/$1*/.cagefs/tmp -type f -name 'magick-*' -delete

printf "\n Success deleting Magisk File on $1 \n \n"
ls -lah /home/$1/.cagefs/tmp/
