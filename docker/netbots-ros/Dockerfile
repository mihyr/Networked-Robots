# syntax=docker/dockerfile:1
FROM osrf/ros:noetic-desktop-full
WORKDIR /ros_ws

#RUN /bin/bash -c '. /opt/ros/noetic/setup.bash'

EXPOSE 11311
EXPOSE 9090

RUN apt-get -y update &&  apt-get -y install git pip


RUN mkdir src && git clone -b master https://github.com/whomihirpatel/4G-Networked_Robots.git src && cd src && pip install -r requirements.txt
#    && git submodule update --init --recursive --progress

RUN . /opt/ros/$ROS_DISTRO/setup.sh && rosdep install --from-paths src --ignore-src -y && catkin_make
RUN /ros_entrypoint.sh
#RUN . /opt/ros/$ROS_DISTRO/setup.sh && catkin_make

RUN apt-get -y install iputils-ping
EXPOSE 1194
CMD ["roscore"]