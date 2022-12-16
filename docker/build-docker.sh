#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

docker build --tag prof-concert/concert_prof_inter:latest . -f $DIR/Dockerfile