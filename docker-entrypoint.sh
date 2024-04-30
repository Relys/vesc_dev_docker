#!/bin/bash
source /opt/esp-idf/export.sh
#Xvfb :99 &
#export DISPLAY=:99
#export XDG_RUNTIME_DIR=/tmp/runtime-root
exec "$@"