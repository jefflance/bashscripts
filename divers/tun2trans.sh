#!/bin/bash

RPORT=9091
LPORT=9092

knock cloud.mala.fr 1981:tcp 1982:tcp 2012:udp && ssh -C -f cloud -L $LPORT:localhost:$RPORT -N

if [ 'x'$1 == 'x' ];
then
    echo "Connection established"
else
    echo "Connection failed"
fi
