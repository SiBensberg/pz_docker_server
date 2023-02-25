#!/bin/bash

sleep 1s

echo "install/Update server"
echo "$USER"
/home/steam/steamcmd/steamcmd.sh +runscript /update_zomboid.txt
#chmod -R 777 /home/linuxgsm/Zomboid/*

#sleep 1000s

echo "start server"
#/home/linuxgsm/Zomboid/start-server.sh -servername berlin
/opt/pzserver/start-server.sh \
        -servername "$SERVER_NAME" \
        -adminusername "$ADMIN_USERNAME" \
        -adminpassword "$ADMIN_PASSWORD"


trap shutdown SIGTERM SIGINT