#!/bin/bash

RPORT=9091
LPORT=9092

#knock mnemon.mala.fr 1981:tcp 1982:tcp 2012:udp &&
ssh -C -f mnemon -L $LPORT:localhost:$RPORT -N

if [ 'x'$1 == 'x' ];
then
    echo "Connection established: access transmission on http://127.0.0.1:9092"
else
    echo "Connection failed"
fi
