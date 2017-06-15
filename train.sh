#!/bin/sh
echo "正在对图像进行校准"
python /root/openface/util/align-dlib.py /input align outerEyesAndNose /align --size 96
echo "正在生成特征数据"
cd /root/openface/batch-represent/;/torch/install/bin/th ./main.lua -outDir /feature -data /align
echo "正在训练数据"
python /root/openface/demos/classifier.py train /feature
echo "已经完成训练"
