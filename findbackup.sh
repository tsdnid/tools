#!/bin/bash
# how to use ?
# run this command
# findbackup.sh $username
# findbackup.sh hilmi
# findbackup.sh dzub
pwd = locate
cd $locate
find /backup /web /sharedfs/support -name $1* | xargs du -sh | sort -rh
