cd /vesc_dev
git clone https://github.com/surfdado/bldc.git
cd /vesc_dev/bldc
git checkout bms_state
cd /vesc_dev
git clone https://github.com/surfdado/vesc_tool.git
cd /vesc_dev/vesc_tool
git checkout bms_state
sed -i 's/bms_fault_state/bms_fault_code/g' datatypes.h #fix typo
cd /vesc_dev
git clone https://github.com/surfdado/vesc_pkg.git
cd /vesc_dev/vesc_pkg
git checkout bmsdev
cd /vesc_dev
