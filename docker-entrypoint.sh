#!/bin/bash
if [ -d "/vesc_dev" ] && [ -z "$(ls -A /vesc_dev)" ]; then
    sudo chmod 777 /vesc_dev
    sudo cp -n /vesc_dev_scripts/* /vesc_dev
fi

if [ ! -d "/vesc_dev/vesc_builds" ]; then
    mkdir /vesc_dev/vesc_builds
	mkdir /vesc_dev/vesc_builds/bldc
	mkdir /vesc_dev/vesc_builds/vesc_tool
	mkdir /vesc_dev/vesc_builds/vesc_express
	mkdir /vesc_dev/vesc_builds/nrf52_vesc
fi

if [ ! -d "/vesc_dev/nRF5_SDK_15.3.0_59ac345" ]; then
wget https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip /vesc_dev/nRF5_SDK_15.3.0_59ac345.zip
unzip nRF5_SDK_15.3.0_59ac345.zip -d /vesc_dev/
fi

if [ ! -d "/vesc_dev/nRF5_SDK_15.3.0_59ac345" ]; then
	cd /vesc_dev
	wget https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip
	unzip nRF5_SDK_15.3.0_59ac345.zip
fi

if [ ! -d "/vesc_dev/esp-idf-v5.0.2" ]; then
	git clone  -b v5.0.2 --recursive https://github.com/espressif/esp-idf.git /vesc_dev/esp-idf-v5.0.2
	/vesc_dev/esp-idf-v5.0.2/install.sh esp32c3 esp32s3 esp32
	/usr/bin/python3 /vesc_dev/esp-idf-v5.0.2/tools/idf_tools.py install
	/usr/bin/python3 /vesc_dev/esp-idf-v5.0.2/tools/idf_tools.py install-python-env
fi
#Xvfb :99 &
#export DISPLAY=:99
#export XDG_RUNTIME_DIR=/tmp/runtime-root
exec "$@"