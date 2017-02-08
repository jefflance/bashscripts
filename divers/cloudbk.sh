#!/bin/bash

BKPDIR=/home/jeff/backup

echo -ne "Backing up ownCloud dir..."
rsync -Aax /var/www/cloud/ $BKPDIR/owncloud-bkpdir_$(date +%d%m%YT%H%M%S)/
echo -ne "[OK]\n"

echo -ne "Backing up ownCloud database..."
mysqldump --lock-tables -h localhost -u root -pcam5byls > $BKPDIR/owncloud-bkpsql_$(date +%d%m%YT%H%M%S).bak
echo -ne "[OK]\n"

exit 0

