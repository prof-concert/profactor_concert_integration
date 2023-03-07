FROM nvidia/cuda:12.0.1-base-ubuntu20.04
FROM arturolaurenzi/xbot2_focal_base_nvidia:latest

USER root
SHELL ["/bin/bash", "-ic"]
# install ros packages
RUN sudo apt-get update && apt-get install -y --no-install-recommends     ros-noetic-perception=1.5.0-1*   ros-noetic-vision-msgs   && rm -rf /var/lib/apt/lists/*

COPY http_proxy_signing_ca.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates

COPY cacert.crt /usr/local/share/ca-certificates/

RUN pip config set global.cert /usr/local/share/ca-certificates/cacert.crt
 
USER user
SHELL ["/bin/bash", "-ic"]

WORKDIR /home/user

COPY requirements.txt /home/user/
RUN pip install -r requirements.txt

RUN pip install --upgrade numpy
RUN pip install scipy
# create concert_ws and set it as home directory
RUN mkdir concert_ws
WORKDIR /home/user/concert_ws

#build the workspace
RUN mkdir src
RUN catkin_make
# set ownership to user for the whole home folder
RUN chown -R user .

# change user, copy start script (launches gazebo and gzweb)
USER user