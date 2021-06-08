#!/usr/bin/env bash

###################
##   CONSTANTS   ##
###################

VERSION="[v1.00]"
AUTHOR="mind2hex"


#####################
## Basic Functions ##
#####################

help(){
    echo "$VERSION"
    echo "usage: ./qlps.sh start finish"
    echo "qlps stands for quick local port scanner"
    echo "optiions:"
    echo "    -h, --help           : Show help message"
    exit 0
}

ERROR(){
    echo -e "[X] \e[0;32mError...\e[0m"
    echo "[*] Function: $1"
    echo "[*] Reason:   $2"
    echo "[X] Returning errorcode 1"
    exit 1
}

argument_parser(){
    
    while [[ $# -gt 0 ]];do
	case $1 in
	    -h|--help) help;;
	    *) shift;
	esac
    done
}

#####################
## Checking Area   ##
#####################

argument_checker(){
    # Nothing to check
    echo -e ""
}

#####################
## Processing Area ##
#####################

argument_processor(){
    for i in $(seq $1 $2);do
	echo -en "[#] Trying Port: $i\r"
	nc -z -v localhost $i 2>/dev/null
	if [[ $? -ne 0 ]];then
	    continue
	else
	    echo -e "[#] Open Port Found: $i         "
	fi
    done
}

argument_parser "$@"
argument_checker
argument_processor $1 $2
exit 0


# TO FIX
# 1. The scan is no so quick ;(
# 2. Better CLI aruments handling
