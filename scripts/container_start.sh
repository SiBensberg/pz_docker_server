#!/bin/bash

echo "Install/Update server:"
echo "$USER"
/home/steam/steamcmd/steamcmd.sh +runscript /update_zomboid.txt

echo "################################################################"
echo "Starting server:"
/opt/pzserver/start-server.sh \
        -servername "$SERVER_NAME" \
        -adminusername "$ADMIN_USERNAME" \
        -adminpassword "$ADMIN_PASSWORD"


trap shutdown SIGTERM SIGINT