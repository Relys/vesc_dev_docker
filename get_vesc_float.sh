cd /vesc_dev
#git clone https://github.com/surfdado/bldc.git
git clone https://github.com/vedderb/bldc.git
cd /vesc_dev/bldc
#git checkout bms_state
cd /vesc_dev
#git clone https://github.com/surfdado/vesc_tool.git
git clone https://github.com/vedderb/vesc_tool.git
cd /vesc_dev/vesc_tool
#git checkout bms_state
#sed -i 's/bms_fault_state/bms_fault_code/g' datatypes.h #fix typo
cd /vesc_dev
git clone https://github.com/contactsimonwilson/vesc_pkg.git
cd /vesc_dev/vesc_pkg
git checkout float-accessories
cd /vesc_dev
git clone https://github.com/contactsimonwilson/vesc_express.git
cd /vesc_dev/vesc_express
git checkout hardware-targets
cd /vesc_dev
git clone https://github.com/vedderb/nrf52_vesc.git