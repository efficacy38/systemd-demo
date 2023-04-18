#!/bin/bash
# set -x

# check options
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
# handle SIGINT, exit normally
trap "printf '%s is interrupt\n' $NAME | tee -a $FILE_PATH; exit" SIGINT
# handle SIGTERM, "without" exit
trap "echo 'simulating the buggy or high load situation\n' sleep infinity" SIGTERM

# main logic
printf "start\t %s\n" $NAME | tee -a $FILE_PATH

for ((i=0; i != $TIME; i++)); do
	date
	sleep 1
done

# quit
printf "end\t %s\n" $NAME | tee -a $FILE_PATH

# timeout and quit with status code 2
exit 2

