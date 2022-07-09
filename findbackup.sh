#!/bin/bash
pwd = locate
cd $locate
find /backup /web /sharedfs/support -name $1* | xargs du -sh | sort -rh
