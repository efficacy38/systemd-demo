#!/bin/sh

# install the counter.py
find . -name '*\.sh' -exec install -v {} /usr/local/bin/ \;

# install the systemd script
find .  -regextype "egrep" -regex '.*(timer|service)' -exec install -v {} /etc/systemd/system/ \;
systemctl daemon-reload

# clean up the test file
mkdir -p /data
echo "----" >> /data/TEST
chmod 666 /data/TEST
