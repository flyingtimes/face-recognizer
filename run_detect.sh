#!/bin/bash
docker run -it -v $1/input:/input -v $1/align:/align -v $1/feature:/feature -v $1/detect:/detect clarkchan/rpi-openface bash /root/detect.sh /detect/$2
