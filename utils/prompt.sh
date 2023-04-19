#!/bin/bash
# set -x

# check options
if [[ $# -lt 1 ]]; then
    echo """\
usage: prompt.sh NAME MESSAGE
    NAME: the name would logging at /data/TEST1
    MESSAGE: what text would be logging at /data/TEST1
    """ 1>&2
	exit 1
fi

FILE_PATH=/data/TEST
NAME=$1
MESSAGE=$2

# main logic
printf '%s %s\n' "$NAME" "$MESSAGE" | tee -a $FILE_PATH;

# timeout and quit with status code 0
exit 0

