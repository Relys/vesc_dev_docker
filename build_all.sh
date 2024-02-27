cd /vesc_dev
./get_vesc_float.sh
./build_vesc.sh
./build_vesc_express.sh
cd /vesc_dev/nrf52_vesc
make SDK_ROOT=/vesc_dev/nRF5_SDK_15.3.0_59ac345 IS_52832=0 upload
make SDK_ROOT=/vesc_dev/nRF5_SDK_15.3.0_59ac345 IS_52832=1 upload
cp /vesc_dev/nrf52_vesc/_build/nrf52840_xxaa.hex /vesc_dev/vesc_builds/nrf52_vesc/
cp /vesc_dev/nrf52_vesc/_build/nrf52832_xxaa.hex /vesc_dev/vesc_builds/nrf52_vesc/
cd /vesc_dev