#!/bin/bash
source /opt/qt515/bin/qt515-env.sh
Xvfb :99 &
export DISPLAY=:99
export XDG_RUNTIME_DIR=/tmp/runtime-root
exec "$@"