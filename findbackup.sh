#!/bin/bash

# Find Backup Active/Suspend/Terminate cPanel $user
# (c) 2022 Hilmi Afifi DomaiNesia

# set verbose to null
verbose=""

GREEN=$(tput bold; tput setaf 2)
EGREEN=$(tput sgr0)

# print help message
helper() {
  tput bold
  tput setaf 2
  echo "Finding Location Backup User"
  echo
  echo -e "Syntax: "
  echo -e "\tfindbackup.sh [-u|-h] \n"
  echo -e "Usage: "
  echo -e "\tfindbackup.sh -u hilmi \n"
  echo -e "Options: "
  echo -e "\t-u \tspecify a cPanel account."
  echo -e "\t-h \tprint this help."
  echo
  tput sgr0
  exit 0
}

# main workhorse to finding backup each passed user
find_backup() {

  # get some cpanel user
  user=$1

  if [ ! -z $user ]
  then
  # then, start doing work

    # start finding backup
    tput bold
    tput setaf 4
    echo -e "\n${GREEN}==| Finding Backup cPanel User... $user ${EGREEN}\n"
    tput setaf 3
    echo "------------------------"
    tput sgr0

    find /web /sharedfs/support /backup -name $user* | xargs du -sh | sort -rh;

    # end of finding backup
    tput bold
    tput setaf 3
    echo -e "\n${GREEN}==| Here's Result!. ${EGREEN}\n"
    echo "------------------------"
    printf "\n\n"
    tput sgr0
    else
      helper
      exit 1
    fi
  return 0
}

# main case function, switches options passed to it
case "$1" in
    -h)
      helper
      ;;
    --help)
      helper
      ;;
    -v)
      verbose="-v"

case "$2" in
    -u)
      find_backup "$3"
      ;;
    *)
      tput bold
      tput setaf 1
        echo "Invalid Option!"
        helper
      ;;

  esac
  ;;
    -u)
      find_backup "$2"
      ;;
    *)
      tput bold
      tput setaf 1
        echo "Invalid Option!"
        helper
      ;;
  esac
