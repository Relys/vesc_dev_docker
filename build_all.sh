cd /vesc_dev
mkdir /vesc_dev/vesc_builds
mkdir /vesc_dev/vesc_builds/bldc
mkdir /vesc_dev/vesc_builds/vesc_tool
mkdir /vesc_dev/vesc_builds/vesc_express
mkdir /vesc_dev/vesc_builds/nrf52_vesc
./get_vesc.sh
./build_vesc.sh
./build_vesc_express.sh
./build_nrf52_vesc.sh