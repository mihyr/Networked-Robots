# syntax=docker/dockerfile:1
FROM osrf/ros:noetic-desktop-full
WORKDIR /ros_ws

#RUN /bin/bash -c '. /opt/ros/noetic/setup.bash'

EXPOSE 80
EXPOSE 11311
EXPOSE 8080
EXPOSE 9090

RUN apt-get -y update
RUN apt-get -y install git nginx pip 
#npm nodejs build-essential

RUN mkdir src && git clone -b master https://github.com/whomihirpatel/4G-Networked_Robots.git src && cd src && pip install -r requirements.txt
#    && git submodule update --init --recursive --progress
RUN . /opt/ros/$ROS_DISTRO/setup.sh && rosdep install --from-paths src --ignore-src -y && catkin_make
#RUN cd src/webviz && npm run bootstrap && npm run build-static-webviz && npm run serve-static-webviz



#RUN . /opt/ros/$ROS_DISTRO/setup.sh && catkin_make
RUN cp src/website_front_end/* /var/www/html && mv src/nginx_scripts/default.conf /etc/nginx/conf.d/default.conf && rm /etc/nginx/sites-enabled/default
RUN mkdir /etc/nginx/apps && cp src/nginx_scripts/webviz.conf /etc/nginx/apps/webviz.conf
CMD ["nginx","-g","daemon off;"]
