#!/bin/bash
# set -x

if [[ $# -lt 1 ]]; then
    echo """\
usage: wait.sh NAME [FAIL time]
    NAME: the name would logging at /data/TEST
    FAIL time: -1 means never fail, default is -1
    """ 1>&2
	exit 1
fi

FILE_PATH=/data/TEST
NAME=$1
TIME=$2
: ${TIME:="-1"}
echo $TIME


# handle the termination
trap "printf '%s is interrupt\n' $NAME | tee -a $FILE_PATH; exit" SIGINT
trap "echo 'simulating the buggy or high load situation\n' sleep infinity" SIGTERM

printf "start\t %s\n" $NAME | tee -a $FILE_PATH

for ((i=0; i != $TIME; i++)); do
	date
	sleep 1
done

printf "end\t %s\n" $NAME | tee -a $FILE_PATH
exit 2

