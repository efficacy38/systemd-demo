#!/bin/bash
# set -x

# check options
if [[ $# -lt 1 ]]; then
	echo "usage: wait.sh NAME [FAIL time]" 1>&2
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
# handle SIGTERM, exit normally
trap "printf '%s is terminated\n' $NAME | tee -a $FILE_PATH; exit" SIGTERM

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

