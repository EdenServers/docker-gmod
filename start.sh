#!/bin/bash

#Setting up SFTP
if ! id -u "$USERNAME" >/dev/null 2>&1; then
    PASSWORD=$(perl -e 'print crypt($ARGV[0], "password")' $PASSWORD)
    useradd -d /server/gmod --shell /usr/bin/rssh --password $PASSWORD $USERNAME
    chown -R $USERNAME:$USERNAME /server/gmod
fi

/etc/init.d/ssh start

cd /server/steamcmd && ./steamcmd.sh +login anonymous \
                 +force_install_dir /server/gmod \
                 +app_update 4020 validate \
                 +quit 

cd /server/gmod && ./srcds_run -debug -game garrysmod -console -usercon  \
                               +maxplayers $MAXPLAYERS \  
                               +map $MAP  $STARTUP_OPTIONS
