#!/bin/bash

sleep 1s

echo "install/Update server"
/home/steam/steamcmd/steamcmd.sh +runscript /update_zomboid.txt

sleep 1000s

echo "start server"
#/home/linuxgsm/Zomboid/start-server.sh -servername berlin