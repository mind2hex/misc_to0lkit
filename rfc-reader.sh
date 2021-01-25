#!/usr/bin/env bash

## @author:       Johan Alexis | mind2hex
## @github:       https://github.com/mind2hex

## Project Name:  rfc-reader.sh
## Description:   bash script to download and watch rfc pages

## @style:        https://github.com/fryntiz/bash-guide-style

## @licence:      https://www.gnu.org/licences/gpl.txt
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>

#############################
##     CONSTANTS           ##
#############################  

VERSION="[v1.00]"
AUTHOR="mind2hex"
dblocation="/home/$USER/.config/rfc_DB"

#############################
##    BASIC FUNCTIONS      ##
#############################

help(){
    echo "$VERSION"
    echo "usage: ./rfc_page -n 777"
    echo "Options:"
    echo  "      -n,--numpage <int>    : Number of the rfc      "
    echo  "      -l,--list             : List Downloaded pages  "
    echo  "      --no-less             : Disable less           "
    echo  "      -h,--help             : Print this help message"
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
    ## help if no arguments provided
    if [[ $# -eq 0 ]];then
	help
    fi
    
    while [[ $# -gt 0 ]];do
	case $1 in
	    -n|--numpage) RFC=$2 && shift && shift ;;
	    -l|--list) LISTONLY="TRUE" && shift    ;;
	    --no-less) NOLESS="TRUE"  && shift          ;;	    
	    -h|--help) help                        ;;	    
	     *) help                               ;;
	esac 
    done

    ## Setting up default variables
    echo ${LISTONLY:="FALSE"} &>/dev/null 
    echo ${NOLESS:="FALSE"} &>/dev/null
    
}

#############################
##    CHECKING AREA        ##
#############################  

argument_checker(){
    ## Checking DB
    argument_checker_DB

    ## If list only is set then return
    if [[ ${LISTONLY} == "TRUE" ]];then
	return 0
    fi    
    
    ## rfc number check
    argument_checker_number $RFC

    ## Network Connection check
    argument_checker_connection

    ## RFC page existence check
    argument_checker_RFC_page_existence
}

argument_checker_number(){
    ## Basic number check with re
    re='^[0-9]+$'
    if ! [[ $RFC =~ $re ]];then
	ERROR "argument_checker_number" "$RFC is not a number"
    fi
}

argument_checker_DB(){
    ## Checking .config directory
    if ! [[ -d "/home/$USER/.config" ]];then
	mkdir "/home/$USER/.config"
    fi

    ## Checking db directory
    if ! [[ -d $dblocation ]];then
	mkdir $dblocation
    fi
}

argument_checker_connection(){
    ## Using simple ping
    ping -c 1 rfc-editor.org &>/dev/null
    if [[ $? -ne 0 ]];then
	ERROR "argument_checker_connection" "Unable to ping server: rfc-editor.org"
    fi

}

argument_checker_RFC_page_existence(){
    ## This function check first if page exist in dblocation
    ## if not then search for the page in the server
    
    ls $dblocation | grep --word-regexp $RFC &>/dev/null
    if [[ $? -ne 0 ]];then
	if [[ $(curl --head "https://www.rfc-editor.org/rfc/rfc${RFC}.txt" | grep "Not Found") ]];then
	    ERROR "argument_checker_RFC_page_existence" "RFC page $RFC not found"
	fi
    fi
}

#############################
##   PROCESSING AREA       ##
#############################

argument_processor(){
    ## ListOnly? ok baby
    if [[ ${LISTONLY} == "TRUE" ]];then
	argument_processor_list_only
    fi

    ## Searching for RFC in dblocation
    if [[ $(ls $dblocation | grep --word-regexp $RFC) ]];then

	argument_processor_print_rfc
	exit 0
    fi


    argument_processor_download_rfc
    argument_processor_print_rfc
    
    exit 0
}

argument_processor_list_only(){
    for i in $(ls $dblocation);do
	echo "==================================================================== $i"
	head -n 15 ${dblocation}/$i | awk NF
    done
    exit 0
}

argument_processor_print_rfc(){
    if [[ $NOLESS == "TRUE" ]];then
	cat $dblocation/$RFC
    else
	cat $dblocation/$RFC | less
    fi
}

argument_processor_download_rfc(){
    info=$(GET "https://rfc-editor.org/rfc/rfc${RFC}.txt")
    echo "$info" > $dblocation/$RFC
}

argument_parser "$@"
argument_checker
argument_processor
exit 0
