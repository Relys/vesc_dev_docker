cd /vesc_dev/vesc_express
idf.py fullclean
idf.py build -DHW_TARGET="Devkit C3"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_Devkit_C3.bin
idf.py fullclean
idf.py build -DHW_TARGET="rESCue Mini"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_rESCue_Mini.bin
idf.py fullclean
idf.py build -DHW_TARGET="rESCue S3"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_rESCue_S3.bin
idf.py fullclean
idf.py build -DHW_TARGET="VDisp"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_VDisp.bin
idf.py fullclean
idf.py build -DHW_TARGET="VESC Express T"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_VESC_Express_T.bin
idf.py fullclean
idf.py build -DHW_TARGET="BMS RB"
cp /vesc_dev/vesc_express/build/vesc_express.bin /vesc_dev/vesc_builds/vesc_express/vesc_express_BMS_RB.bin