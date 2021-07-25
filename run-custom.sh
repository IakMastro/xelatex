
docker run -it -v $PWD/docs:/home -v /tmp/.X11-unix:/tmp/.X11-unix  -e DISPLAY=unix$DISPLAY  xelatex-thesis-custom:latest /bin/bash
