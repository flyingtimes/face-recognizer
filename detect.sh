#!/bin/bash
cd /root/openface/demos/;python -W ignore::DeprecationWarning ./classifier.py infer /feature/classifier.pkl $1

