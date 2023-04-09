#!/bin/sh

# install the counter.py
install *.sh /usr/local/bin/


# install the systemd script
install *.service /etc/systemd/system/
systemctl daemon-reload

# clean up the test file
mkdir -p /data
echo "----" >> /data/TEST
chmod 666 /data/TEST
