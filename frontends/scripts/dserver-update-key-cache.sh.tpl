#!/bin/ksh

CACHEDIR=/var/run/dserver/cache
DSERVER_USER=_dserver
DSERVER_GROUP=_dserver

echo 'Updating SSH key cache'

ls /home/ | while read remoteuser; do
    keysfile=/home/$remoteuser/.ssh/authorized_keys

    if [ -f $keysfile ]; then
        cachefile=$CACHEDIR/$remoteuser.authorized_keys
        echo "Caching $keysfile -> $cachefile"

        cp $keysfile $cachefile
        chown $DSERVER_USER:$DSERVER_GROUP $cachefile
        chmod 600 $cachefile
    fi
done

# Cleanup obsolete public SSH keys
find $CACHEDIR -name \*.authorized_keys -type f |
while read cachefile; do
    remoteuser=$(basename $cachefile | cut -d. -f1)
    keysfile=/home/$remoteuser/.ssh/authorized_keys

    if [ ! -f $keysfile ]; then
        echo 'Deleting obsolete cache file $cachefile'
        rm $cachefile
    fi
done

echo 'All set...'
