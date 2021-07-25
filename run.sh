#!/bin/sh

docker pull hub.swarmlab.io:5480/xelatex-base:latest
docker run -it -v $PWD/docs:/home -v /tmp/.X11-unix:/tmp/.X11-unix  -e DISPLAY=unix$DISPLAY  hub.swarmlab.io:5480/xelatex-base:latest /bin/bash

echo ""
echo "Get"
echo ""
echo "Pulling  ..."
echo "ERROR: Get https://hub.swarmlab.io:5480:/v2/: x509: certificate signed by unknown authority"
echo ""
echo "run"
echo ""
echo "sudo ./get-swarmlab.keys"
echo ""
