#!/bin/bash
sudo chmod 777 /vesc_dev
sudo cp -n /vesc_dev_scripts/* /vesc_dev
#Xvfb :99 &
#export DISPLAY=:99
#export XDG_RUNTIME_DIR=/tmp/runtime-root
exec "$@"