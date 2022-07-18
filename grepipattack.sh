
#!/bin/bash

tail -n 1000 /var/log/nginx/access.log | grep $1 | awk '{print $1}' | sort -n | sort -u > /web/ip.list
