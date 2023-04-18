#!/bin/bash
# set -x

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


# handle the termination
trap "printf '%s is interrupt\n' $NAME | tee -a $FILE_PATH; exit" SIGINT
trap "printf '%s is terminated\n' $NAME | tee -a $FILE_PATH; exit" SIGTERM

printf '%s %s\n' "$NAME" "$MESSAGE" | tee -a $FILE_PATH;

exit 0

