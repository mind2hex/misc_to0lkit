#!/usr/bin/env bash

## @author:       Johan Alexis | mind2hex
## @github:       https://github.com/mind2hex

## Project Name:  colors.sh
## Description:   bash script to print a color table

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

#############################
##   BASIC FUNCTIONS       ##
#############################

help(){
    echo "This program simply show colors"
    echo "usage: ./colors.sh"
    echo "options:"
    echo "     -v,--version      : Simply show version"
    echo "     -h,--help         : Show this help message"
    exit 1
}

ERROR(){
    echo -e "[X] \e[0;31mError...\e[0m"
    echo "[*] Function: $1"
    echo "[*] Reason:   $2"
    echo "[X] Returning errorcode 1"
    exit 1
}

argument_parser(){
    ## This loop handle CLI arguments
    while [[ $# -gt 0 ]];do
	case "$1" in
	    -v|--version) echo $VERSION && exit 0 ;;
	    -h|--help) help ;;
	    *) ERROR "argument_parser" "Wrong argument [$key]" ;;
	esac
    done
}

#############################
##  PROCESSING AREA        ##
#############################

argument_processor(){
    argument_processor_print_header
}

argument_processor_print_header(){
    printf "|============|===================================================================|\n"
    printf "| %10s | %-10s %-10s %-10s %-10s %-10s %-10s |\n" "COLOR" "NORMAL" "BOLD" "DIM" "UNDERLINED" "BLINK" "INVERTED"
    printf "|============|===================================================================|\n"
    printf "|      white | \e[0m%-10s\e[0m \e[1m%-10s\e[0m \e[2m%-10s\e[0m \e[4m%-10s\e[0m \e[5m%-10s\e[0m \e[7m%-10s\e[0m |\n" "\e[0m" "\e[1m" "\e[2m" "\e[4m" "\e[5m" "\e[7m" 
    printf "|      black | \e[0;30m%-10s\e[0m \e[1;30m%-10s\e[0m \e[2;30m%-10s\e[0m \e[4;30m%-10s\e[0m \e[5;30m%-10s\e[0m \e[7;30m%-10s\e[0m |\n" "\e[0;30m" "\e[1;30m" "\e[2;30m" "\e[4;30m" "\e[5;30m" "\e[7;30m"
    printf "|      Red   | \e[0;31m%-10s\e[0m \e[1;31m%-10s\e[0m \e[2;31m%-10s\e[0m \e[4;31m%-10s\e[0m \e[5;31m%-10s\e[0m \e[7;31m%-10s\e[0m |\n" "\e[0;31m" "\e[1;31m" "\e[2;31m" "\e[4;31m" "\e[5;31m" "\e[7;31m"
    printf "|      Green | \e[0;32m%-10s\e[0m \e[1;32m%-10s\e[0m \e[2;32m%-10s\e[0m \e[4;32m%-10s\e[0m \e[5;32m%-10s\e[0m \e[7;32m%-10s\e[0m |\n" "\e[0;32m" "\e[1;32m" "\e[2;32m" "\e[4;32m" "\e[5;32m" "\e[7;32m"
    printf "|     Yellow | \e[0;33m%-10s\e[0m \e[1;33m%-10s\e[0m \e[2;33m%-10s\e[0m \e[4;33m%-10s\e[0m \e[5;33m%-10s\e[0m \e[7;33m%-10s\e[0m |\n" "\e[0;33m" "\e[1;33m" "\e[2;33m" "\e[4;33m" "\e[5;33m" "\e[7;33m"
    printf "|       Blue | \e[0;34m%-10s\e[0m \e[1;34m%-10s\e[0m \e[2;34m%-10s\e[0m \e[4;34m%-10s\e[0m \e[5;34m%-10s\e[0m \e[7;34m%-10s\e[0m |\n" "\e[0;34m" "\e[1;34m" "\e[2;34m" "\e[4;34m" "\e[5;34m" "\e[7;34m"
    printf "|    Magenta | \e[0;35m%-10s\e[0m \e[1;35m%-10s\e[0m \e[2;35m%-10s\e[0m \e[4;35m%-10s\e[0m \e[5;35m%-10s\e[0m \e[7;35m%-10s\e[0m |\n" "\e[0;35m" "\e[1;35m" "\e[2;35m" "\e[4;35m" "\e[5;35m" "\e[7;35m"
    printf "|       Cyan | \e[0;36m%-10s\e[0m \e[1;36m%-10s\e[0m \e[2;36m%-10s\e[0m \e[4;36m%-10s\e[0m \e[5;36m%-10s\e[0m \e[7;36m%-10s\e[0m |\n" "\e[0;36m" "\e[1;36m" "\e[2;36m" "\e[4;36m" "\e[5;36m" "\e[7;36m"
    printf "|Light  Gray | \e[0;37m%-10s\e[0m \e[1;37m%-10s\e[0m \e[2;37m%-10s\e[0m \e[4;37m%-10s\e[0m \e[5;37m%-10s\e[0m \e[7;37m%-10s\e[0m |\n" "\e[0;37m" "\e[1;37m" "\e[2;37m" "\e[4;37m" "\e[5;37m" "\e[7;37m"
    printf "|Dark   Gray | \e[0;90m%-10s\e[0m \e[1;90m%-10s\e[0m \e[2;90m%-10s\e[0m \e[4;90m%-10s\e[0m \e[5;90m%-10s\e[0m \e[7;90m%-10s\e[0m |\n" "\e[0;90m" "\e[1;90m" "\e[2;90m" "\e[4;90m" "\e[5;90m" "\e[7;90m"
    printf "|Light   Red | \e[0;91m%-10s\e[0m \e[1;91m%-10s\e[0m \e[2;91m%-10s\e[0m \e[4;91m%-10s\e[0m \e[5;91m%-10s\e[0m \e[7;91m%-10s\e[0m |\n" "\e[0;91m" "\e[1;91m" "\e[2;91m" "\e[4;91m" "\e[5;91m" "\e[7;91m"
    printf "|Light Green | \e[0;92m%-10s\e[0m \e[1;92m%-10s\e[0m \e[2;92m%-10s\e[0m \e[4;92m%-10s\e[0m \e[5;92m%-10s\e[0m \e[7;92m%-10s\e[0m |\n" "\e[0;92m" "\e[1;92m" "\e[2;92m" "\e[4;92m" "\e[5;92m" "\e[7;92m"
    printf "|Light Yello | \e[0;93m%-10s\e[0m \e[1;93m%-10s\e[0m \e[2;93m%-10s\e[0m \e[4;93m%-10s\e[0m \e[5;93m%-10s\e[0m \e[7;93m%-10s\e[0m |\n" "\e[0;93m" "\e[1;93m" "\e[2;93m" "\e[4;93m" "\e[5;93m" "\e[7;93m"
    printf "|Light  Blue | \e[0;94m%-10s\e[0m \e[1;94m%-10s\e[0m \e[2;94m%-10s\e[0m \e[4;94m%-10s\e[0m \e[5;94m%-10s\e[0m \e[7;94m%-10s\e[0m |\n" "\e[0;94m" "\e[1;94m" "\e[2;94m" "\e[4;94m" "\e[5;94m" "\e[7;94m"
    printf "|Light Magen | \e[0;95m%-10s\e[0m \e[1;95m%-10s\e[0m \e[2;95m%-10s\e[0m \e[4;95m%-10s\e[0m \e[5;95m%-10s\e[0m \e[7;95m%-10s\e[0m |\n" "\e[0;95m" "\e[1;95m" "\e[2;95m" "\e[4;95m" "\e[5;95m" "\e[7;95m"
    printf "|Light  Cyan | \e[0;96m%-10s\e[0m \e[1;96m%-10s\e[0m \e[2;96m%-10s\e[0m \e[4;96m%-10s\e[0m \e[5;96m%-10s\e[0m \e[7;96m%-10s\e[0m |\n" "\e[0;96m" "\e[1;96m" "\e[2;96m" "\e[4;96m" "\e[5;96m" "\e[7;96m"
    printf "|Backg Black | \e[0;49m%-10s\e[0m \e[1;49m%-10s\e[0m \e[2;49m%-10s\e[0m \e[4;49m%-10s\e[0m \e[5;49m%-10s\e[0m \e[7;49m%-10s\e[0m |\n" "\e[0;49m" "\e[1;49m" "\e[2;49m" "\e[4;49m" "\e[5;49m" "\e[7;49m"
    printf "|Backg   Red | \e[0;41m%-10s\e[0m \e[1;41m%-10s\e[0m \e[2;41m%-10s\e[0m \e[4;41m%-10s\e[0m \e[5;41m%-10s\e[0m \e[7;41m%-10s\e[0m |\n" "\e[0;41m" "\e[1;41m" "\e[2;41m" "\e[4;41m" "\e[5;41m" "\e[7;41m"
    printf "|Backg Green | \e[0;42m%-10s\e[0m \e[1;42m%-10s\e[0m \e[2;42m%-10s\e[0m \e[4;42m%-10s\e[0m \e[5;42m%-10s\e[0m \e[7;42m%-10s\e[0m |\n" "\e[0;42m" "\e[1;42m" "\e[2;42m" "\e[4;42m" "\e[5;42m" "\e[7;42m"
    printf "|Backg Yello | \e[0;43m%-10s\e[0m \e[1;43m%-10s\e[0m \e[2;43m%-10s\e[0m \e[4;43m%-10s\e[0m \e[5;43m%-10s\e[0m \e[7;43m%-10s\e[0m |\n" "\e[0;43m" "\e[1;43m" "\e[2;43m" "\e[4;43m" "\e[5;43m" "\e[7;43m"
    printf "|Backg Blue  | \e[0;44m%-10s\e[0m \e[1;44m%-10s\e[0m \e[2;44m%-10s\e[0m \e[4;44m%-10s\e[0m \e[5;44m%-10s\e[0m \e[7;44m%-10s\e[0m |\n" "\e[0;44m" "\e[1;44m" "\e[2;44m" "\e[4;44m" "\e[5;44m" "\e[7;44m"
    printf "|Backg Magen | \e[0;45m%-10s\e[0m \e[1;45m%-10s\e[0m \e[2;45m%-10s\e[0m \e[4;45m%-10s\e[0m \e[5;45m%-10s\e[0m \e[7;45m%-10s\e[0m |\n" "\e[0;45m" "\e[1;45m" "\e[2;45m" "\e[4;45m" "\e[5;45m" "\e[7;45m"
    printf "|Backg  Cyan | \e[0;46m%-10s\e[0m \e[1;46m%-10s\e[0m \e[2;46m%-10s\e[0m \e[4;46m%-10s\e[0m \e[5;46m%-10s\e[0m \e[7;46m%-10s\e[0m |\n" "\e[0;46m" "\e[1;46m" "\e[2;46m" "\e[4;46m" "\e[5;46m" "\e[7;46m"
    printf "|Backg Lgray | \e[0;47m%-10s\e[0m \e[1;47m%-10s\e[0m \e[2;47m%-10s\e[0m \e[4;47m%-10s\e[0m \e[5;47m%-10s\e[0m \e[7;47m%-10s\e[0m |\n" "\e[0;47m" "\e[1;47m" "\e[2;47m" "\e[4;47m" "\e[5;47m" "\e[7;47m"
    printf "|============|===================================================================|\n"

    printf "\e[0m"

}    



#############################
##   STARTING POINT        ##
#############################

argument_parser "$@"
argument_processor
exit 0


