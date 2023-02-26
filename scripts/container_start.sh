#!/bin/bash

echo "Install/Update server:"
echo "$USER"
/home/steam/steamcmd/steamcmd.sh +runscript /update_zomboid.txt

chmod -R 777 /home/steam/Zomboid

echo "################################################################"
echo "Starting server:"
/opt/pzserver/start-server.sh \
        -servername "$SERVER_NAME" \
        -adminusername "$ADMIN_USERNAME" \
        -adminpassword "$ADMIN_PASSWORD"


trap shutdown SIGTERM SIGINT