# Front-End

## Overview
This folder contains website files which help user to connect their robot to the server

- Some html snippets are taken from [codepen](https://codepen.io/rkpasia/pen/LNEQod)

## Usage instructions:
- Update the server ip and port in the `index.html` file.
    ```
    url : 'ws://ip:port'
    ```
- Instead of hosting `index.html` file under nginx, I used python to website under localhost and route the port through nginx.
    ```
    python3 -m http.server port_number
    ```
- A systemd service can be created for the above command. Service tempelate [here](https://github.com/whomihirpatel/4G-Networked_Robots/blob/master/website_front_end/web_service_sample.txt)
- Everytime you update your front-end file, you can restart this service. You dont need to restart entire nginx as this is a python localhost server. Nginx is just reverse proxying to your port.

## Javascript Libraries used:
Libraries | Link
------------ | -------------
roslibjs | [ROS Wiki](http://wiki.ros.org/roslibjs)
eventemitter2 |[ROS Wiki](http://wiki.ros.org/roslibjs)
react |[Website](https://reactjs.org/)
jquery |[Website](https://jquery.com/)