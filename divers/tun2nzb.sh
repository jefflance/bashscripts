#!/bin/bash

RPORT=6789
LPORT=10289

#knock mnemon.mala.fr 1981:tcp 1982:tcp 2012:udp &&
ssh -C -f mnemon -L $LPORT:localhost:$RPORT -N

if [ 'x'$1 == 'x' ];
then
    echo "Connection established: access nzbget on http://127.0.0.1:$LPORT"
else
    echo "Connection failed"
fi
