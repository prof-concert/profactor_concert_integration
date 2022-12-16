FROM arturolaurenzi/xbot2_focal_base_nvidia:latest
USER user
SHELL ["/bin/bash", "-ic"]

WORKDIR /home/user

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