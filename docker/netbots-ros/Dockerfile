# syntax=docker/dockerfile:1
FROM osrf/ros:noetic-desktop-full
WORKDIR /ros_ws

#RUN /bin/bash -c '. /opt/ros/noetic/setup.bash'

EXPOSE 11311
EXPOSE 9090
#EXPOSE 1194

RUN apt-get -y update &&  apt-get -y install git pip openvpn net-tools iputils-ping

RUN mkdir src && git clone -b master https://github.com/whomihirpatel/4G-Networked_Robots.git src && cd src && pip install -r requirements.txt
#    && git submodule update --init --recursive --progress

RUN . /opt/ros/$ROS_DISTRO/setup.sh && rosdep install --from-paths src --ignore-src -y && catkin_make
RUN /ros_entrypoint.sh
#RUN . /opt/ros/$ROS_DISTRO/setup.sh && catkin_make

ENTRYPOINT ["openvpn","--config", "/vpn_ws/ros_admin.ovpn","--float"]
#CMD ["roscore"]
#CMD ["openvpn","--config", "/vpn_ws/ros_admin.ovpn","--float"]