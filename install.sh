#!/bin/bash
# Taking in argument the webhook url

if [ -z "$1" ]; then
    echo "Error: Missing url argument."
elif ! [ $(id -u) = 0 ]; then
    echo "You must run the script as root."
else
    cp system/* /etc/systemd/system/
    cp send-ip.sh /usr/local/bin/send-ip.sh
    touch /var/local/send-ip.txt

    echo $1 > /usr/local/etc/send-ip

    systemctl start send-ip.service
    systemctl enable send-ip.timer
fi
