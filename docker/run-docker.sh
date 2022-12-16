#!/bin/bash

nvidia-docker run --rm -it --gpus all \
 --env="DISPLAY=$DISPLAY" \
 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
 --volume="$HOME/.ssh:/home/user/.ssh:ro" \
 --volume="$HOME/profactor_concert_integration/ros_src:/home/user/concert_ws/src:ro" \
 --name concert_description \
 prof-concert/concert_prof_inter:latest \
 x-terminal-emulator