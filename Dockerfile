FROM joov/rpi-openface
RUN /torch/install/bin/luarocks install csvigo
RUN cd /torch;./install.sh
RUN /torch/install/bin/torch-activate
COPY train.sh /root/
COPY detect.sh /root
env PATH /torch/install/bin:$PATH
