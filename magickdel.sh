#!/bin/bash

# Magick Delete cPanel $user
# (c) 2022  Hilmi Afifi DomaiNesia

# set verbose to null
verbose=""

GREEN=$(tput bold; tput setaf 2)
EGREEN=$(tput sgr0)

# print help message
helper() {
  tput bold
  tput setaf 2
  echo "Deleting Temporary File Magick User"
  echo
  echo -e "Syntax: "
  echo -e "\tmagickdel.sh [-u|-h] \n"
  echo -e "Usage: "
  echo -e "\tmagickdel.sh -u hilmi \n"
  echo -e "Options: "
  echo -e "\t-u \tspecify a cPanel account."
  echo -e "\t-h \tprint this help."
  echo
  tput sgr0
  exit 0
}

# main workhorse to finding backup each passed user
magick_del() {

  # get some cpanel user
  user=$1

  # check user from trueuserdomains
  # make sure user is valid

  if ! grep -oP "\S+: $user$" /etc/trueuserdomains
  then
    tput bold
    tput setaf 1
    echo "Invalid cPanel account"
    tput sgr0
    exit 0
  fi

  if [ -z $user ]
  then
    tput bold
    tput setaf 1
    echo "Need an account name!"
    tput sgr0
    helper

  # else, start doing work
  else

    # start magick delete
    tput bold
    tput setaf 4

    echo -e "\n${GREEN}==| Checking some Magick file on... $user ${EGREEN}\n"
    tput setaf 3
    echo "------------------------"
    tput sgr0
    ls -lah /home/$user/.cagefs/tmp/
    printf "\n\n"
    echo "------------------------"

    echo -e "\n${GREEN}==| Deleting Temporary File Magick User... $user ${EGREEN}\n"
    tput setaf 3
    echo "------------------------"
    tput sgr0

    find /home/$user*/.cagefs/tmp -type f -name 'magick-*' -delete

    # end of finding backup
    tput bold
    tput setaf 3
    echo -e "\n${GREEN}==| Here's Result!. ${EGREEN}\n"
    echo "------------------------"
    ls -lah /home/$user/.cagefs/tmp/
    printf "\n\n"
    tput sgr0

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
      magick_del "$3"
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
      magick_del "$2"
      ;;
    *)
      tput bold
      tput setaf 1
        echo "Invalid Option!"
        helper
      ;;
  esac
