#!/bin/bash

docker run --rm -it --gpus all \
 --runtime=nvidia \
 --env="DISPLAY=$DISPLAY" \
 --env="ROS_MASTER_URI=http://192.168.1.178:11311" \
 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
 --volume="$HOME/.ssh:/home/user/.ssh:ro" \
 --volume="$HOME/profactor_concert_integration/ros_src:/home/user/concert_ws/src:rw" \
 --name concert_description \
 --network docker_bridge_cam \
 --ip 192.168.1.179 \
 prof-concert/concert_prof_inter:latest 
 #x-terminal-emulator