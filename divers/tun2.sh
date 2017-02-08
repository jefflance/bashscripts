#!/bin/bash


TORPORT=9091
NZBPORT=6789
SSH=$(which ssh)


# Functions that do some stuff
function usage() {
    echo "usage: $(basename "$0") [-t]"
}


function connect() {
    # Treatment of arguments
    # $1: type of connection

    case "$1" in
        nzb)
            msg=nzbget
            rport=$NZBPORT
            ;;
        tor)
            msg=transmission
            rport=$TORPORT
            ;;
        *)
            ;;
    esac

    echo -ne "Tunneling to $msg service..."
    lport=102$(echo $rport | sed 's/^.*\([0-9][0-9]\)/\1/')
    $SSH -C -f mnemon -L $lport:localhost:$rport -N
    echo " [OK]\n"
    echo "Access to $msg on on http://127.0.0.1:$lport"
}


# Parsing arguments
if [ $# -eq 0 ]
then
    usage
    exit 0
fi

# echo "BEFORE GETOPT: $@";

ARGS=$(getopt -o ht: -l help,type: -n 'tun2.sh' -- "$@")
# ARGS=$(getopt ht: "$*")

# echo "AFTER  GETOPT: $@";

# Bad arguments
if [ $? != 0 ] ; then exit 1 ; fi

eval set -- "$ARGS"

# echo "AFTER SET -- \$ARGS: $@";

while true
do
    case "$1" in
        -h|--help)
            usage
            break
            ;;
        -t|--type)
            connect "$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Invalid argument"
            break
            ;;
    esac
done

# echo "AFTER OPTION PROCESSING: $@";

exit 0
