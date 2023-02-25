#!/bin/bash
docker run -d -e SERVER_NAME="berlin" \
              -e ADMIN_PASSWORD="BTSV1967" \
              -v $(pwd)/server-data:/server-data \
              -p 16261:16261/udp \
              -p 16262:16262/udp \
              --name pz_test \
              server_test

                            #-v $(pwd)/pzserver:/opt/pzserver \

