# !/bin/bash
# A shell script to swap_on and ddos_on.

for DOMAIN in $(cat domain.txt)
do
  curl localhost/ddos_on?domain=$DOMAIN
  for IPv4 in `curl -4 https://ifconfig.co`
  do
    /usr/local/cpanel/bin/swapip $IPv4 127.0.0.1 127.0.0.1 $DOMAIN
    for IPv6 in `curl -6 https://ifconfig.co`
    do
      /usr/local/cpanel/bin/swapip $IPv6 ::1 ::1 $DOMAIN
    done
  done
done

printf "\n Hello there!"
printf "\n Success swap_on this domains : $(cat domain.txt) \n \n"
