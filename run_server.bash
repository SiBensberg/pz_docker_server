#!/bin/bash
docker run -d -e SERVER_NAME="berlin" \
              -e ADMIN_PASSWORD="BTSV1967" \
              -v $(pwd)/server-data:/server-data \
              -v $(pwd)/Zomboid:/home/steam/Zomboid \
              -p 16261:16261/udp \
              -p 16262:16262/udp \
              -p 16261-16265:16261-16265 \
              --name pz_serv_sb \
              pz_server_sb

