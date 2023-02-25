#!/bin/bash
docker run -it --entrypoint=/bin/bash \
              -p 16261:16261/udp \
              -p 16262:16262/udp \
              --name pz_debug \
              server_test

