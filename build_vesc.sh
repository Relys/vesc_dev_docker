cd /vesc_dev/bldc
#make arm_sdk_install
make all_fw_package
python package_firmware

cd /vesc_dev/bldc/package && \
find . -type d -exec mkdir -p -- /vesc_dev/vesc_tool/res/firmwares/'{}' \; && \
find . -type f -exec ln -s -- "$PWD"/'{}' /vesc_dev/vesc_tool/res/firmwares/'{}' \;

cd /vesc_dev/vesc_tool
./build_lin

unzip /vesc_dev/vesc_tool/build/lin/vesc_tool_platinum_linux.zip -d /tmp

file=$(find /tmp -name "vesc_tool*")

if [[ -n $file ]]; then
    mv "$file" /usr/local/bin/vesc_tool
fi



if [[ -n $file ]]; then
    mv "$file" /vesc_dev/vesc_pkg/vesc_tool
fi


cd /vesc_dev/vesc_pkg
make