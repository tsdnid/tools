# !/bin/bash
# A shell script to swap_off or ddos_off.

for DOMAIN in $(cat domain.txt)
do
  curl localhost/ddos_off?domain=$DOMAIN
  for IPv4 in `curl -4 https://ifconfig.co`
  do
    /usr/local/cpanel/bin/swapip 127.0.0.1 $IPv4 $IPv4 $DOMAIN
    for IPv6 in `curl -6 https://ifconfig.co`
    do
      /usr/local/cpanel/bin/swapip ::1 $IPv6 $IPv6 $DOMAIN
    done
  done
done

printf "\n Hello there!"
printf "\n Success swap_off this domains : $(cat domain.txt) \n \n"
