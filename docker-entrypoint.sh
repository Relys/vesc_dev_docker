#!/bin/bash
chmod 777 /vesc_dev
cp /vesc_dev_scripts/* /vesc_dev
#Xvfb :99 &
#export DISPLAY=:99
#export XDG_RUNTIME_DIR=/tmp/runtime-root
exec "$@"