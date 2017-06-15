#!/bin/bash
docker run -it -v $1/input:/input -v $1/align:/align -v $1/feature:/feature clarkchan/rpi-openface bash /root/train.sh
