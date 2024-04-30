cd /vesc_dev/nrf52_vesc
make SDK_ROOT=/opt/nRF5_SDK_15.3.0_59ac345 IS_52832=0 upload
make SDK_ROOT=/opt/nRF5_SDK_15.3.0_59ac345 IS_52832=1 upload
cp /vesc_dev/nrf52_vesc/_build/nrf52840_xxaa.hex /vesc_dev/vesc_builds/nrf52_vesc/
cp /vesc_dev/nrf52_vesc/_build/nrf52832_xxaa.hex /vesc_dev/vesc_builds/nrf52_vesc/