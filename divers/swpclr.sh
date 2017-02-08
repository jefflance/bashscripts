#!/bin/bash

echo -ne "Clearing memory swap... "
swapoff -a && swapon -a
echo -ne "[OK]"

exit 0
