cd /vesc_dev/bldc
make arm_sdk_install
#sudo ln -s /vesc_dev/bldc/tools/gcc-arm-none-eabi-7-2018-q2-update /usr/local/gcc-arm-none-eabi-7-2018-q2-update
make all_fw_package
python package_firmware

cd /vesc_dev/bldc/package && \
find . -type d -exec mkdir -p -- /vesc_dev/vesc_tool/res/firmwares/'{}' \; && \
find . -type f -exec ln -s -- "$PWD"/'{}' /vesc_dev/vesc_tool/res/firmwares/'{}' \;

cp -r /vesc_dev/bldc/package /vesc_dev/vesc_builds/bldc

cd /vesc_dev/vesc_tool
./build_lin

cp -r /vesc_dev/vesc_tool/build /vesc_dev/vesc_builds/vesc_tool

unzip /vesc_dev/vesc_tool/build/lin/vesc_tool_platinum_linux.zip -d /tmp

file=$(find /tmp -name "vesc_tool*")


if [[ -n $file ]]; then
    sudo mv "$file" /usr/local/bin/vesc_tool
fi


cd /vesc_dev/vesc_pkg
make

find "/vesc_dev/vesc_pkg" -type f -name "*.vescpkg" -exec cp {} "/vesc_dev/vesc_builds/vesc_pkg" \;