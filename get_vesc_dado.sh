cd /
git clone https://github.com/surfdado/bldc.git
cd /bldc
git checkout bms_state
cd /
git clone https://github.com/surfdado/vesc_tool.git
cd /vesc_tool
git checkout bms_state
sed -i 's/bms_fault_code/bms_fault_state/g' commands.h #fix typo
sed -i 's/bms_fault_code/bms_fault_state/g' commands.cpp #fix typo
cd /
git clone https://github.com/surfdado/vesc_pkg.git
cd /vesc_pkg
git checkout bmsdev
cd /
