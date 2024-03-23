cd /vesc_dev/vesc_express
source /vesc_dev/esp-idf-v5.0.2/export.sh
idf.py fullclean
idf.py build -DHW_NAME="Devkit C3"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_Devkit_C3.bin
idf.py fullclean
idf.py build -DHW_NAME="rESCue Mini"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_rESCue_Mini.bin
idf.py fullclean
idf.py build -DHW_NAME="rESCue S3"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_rESCue_S3.bin
idf.py fullclean
idf.py build -DHW_NAME="VDisp"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_VDisp.bin
idf.py fullclean
idf.py build -DHW_NAME="VESC Express T"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_VESC_Express_T.bin
idf.py fullclean
idf.py build -DHW_NAME="BMS RB"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_BMS_RB.bin