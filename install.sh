#!/bin/sh

if [ ! -f "/proc/cpuinfo" ]; then
  echo '只能在树莓派安装本程序.'
  exit
fi
# 安装docker
if ! hash docker 2>/dev/null;then
  echo '没有检测到docker，需要安装docker,请等待......'
  curl -sSL https://get.docker.com | sh
  if hash docker 2>/dev/null;then
    echo 'docker 安装完毕.' 
  else
    echo 'docker 安装失败.'
  fi
else
  echo '检测到已经安装docker.'
fi
# 安装镜像文件
if [[ "$(docker images -q clarkchan/rpi-openface 2> /dev/null)" == "" ]]; then
  echo '正在下载安装镜像文件(大小约2GB),请等待......'
  docker pull clarkchan/rpi-openface
  echo '镜像文件安装完毕.'
else
  echo '镜像文件clarkchan/rpi-openface已经存在,可以直接运行.'
fi
echo '运行:'
echo '    bash run_train.sh [需要训练的图像数据路径]'
echo '    例如:bash run_train.sh $PWD #代表将本路径作为图像数据路径，程序会自动访问下面的input,align,feature 路径 '
echo '    bash run_detect.sh [需要训练的图像数据路径] [需要识别的文件]'
echo '    例如:bash run_detect.sh $PWD wbq01.jpg
echo '试试看吧.'
