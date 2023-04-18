#!/bin/bash
# set -x

if [[ $# -lt 1 ]]; then
    echo """\
usage: prompt.sh NAME MESSAGE [ERROR]
    NAME: the name would logging at /data/TEST1
    MESSAGE: what text would be logging at /data/TEST1
    ERROR: if 1 return value would be -1, else would be 0
    """ 1>&2
	exit 1
fi

FILE_PATH=/data/TEST
NAME=$1
MESSAGE=$2
ERROR=$3

# handle the termination
trap "printf '%s is interrupt\n' $NAME | tee -a $FILE_PATH; exit" SIGINT
trap "printf '%s is terminated\n' $NAME | tee -a $FILE_PATH; exit" SIGTERM

printf "%s %s" $NAME $MESSAGE | tee -a $FILE_PATH;

[[ -z $ERROR ]] && exit -1
exit 0

