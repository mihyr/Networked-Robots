# Server Listener Package

## Overview
This package is used for connecting to remote robots, subscribe to desired topics as 'json' message and republish it as ros message under `/robot_name/topic` on the server.

### Nodes List
Node | Description
------------ | -------------
listener| connects to remote robot using package `roslibpy`, converts `json` message back to ros messsage using `rospy_message_converter` and publishes messages under local namespace topics
agent_latency_test | takes agent ip, port args and calculates network roundtrip time between agent and server

## Launch file usage Instructions

- `listener_bringup.launch` connects the server with remote robot, subscribe to desired topics as 'json' message and republish it as ros message under `/robot_name/topic` on the server.
    ```
    roslaunch server_listener listener_bringup.launch ip:=mihy.tech port:=10401 robot_name:=alphabot tf:=true joint_states:=true scan:=true gps:=true tf_static:=true
    ```

    ## `listener_bringup.launch` configuration options:

    Args | Default | Description
    ------------ | ------------- | -------------
    `robot_name:=zetabot`|**required**| Name of the robot (received from front-end)
    `ip:=mihy.tech` |**required**|  IP of the robot (received from front-end)
    `port:=10402` |**required**|  Port of the robot (received from front-end)
    `imu:=true` |`false`| get imu data from remote robot
    `cmd_vel:=true`|`false`| get cmd_vel data from remote robot
    `joint_states:=true`|`true`| get joint_states data from remote robot
    `map:=true`|`true`| get map data from remote robot
    `map_metadata:=true` |`true`| get map_metadata data from remote robot
    `scan:=true` |`true`| get v data from remote robot
    `odom:=true` |`false`| get odom data from remote robot
    `slam_entropy:=true` |`false`| get slam_entropy data from remote robot
    `tf:=true` |`true`| get tf data from remote robot
    `tf_static:=true` |`true`| get tf_static data from remote robot
    `gps:=true` |`true`| get gps data from remote robot
    `test_frequency:=80`|80| Publishing frequency
- If you wish to subscribe to any other message type not mentioned in the list above, you will have to edit the node and using the tempelate given in the node, you can add the message type you like.

- `multi_robot_listener_bringup.launch` is used if user wants to launch entire pipeline from backend, without using website. This requires prior knowledge of remote robot's IP, port, and name. Before launching, edit the `server_params.yaml` and add the robots to the list as shown below:
    ```
    nano config/server_params.yaml
    ---
    #Note: This parameters are meant for listener node
    Fr  : 80   #Define listening and local publishing frequency

    #Define robot names and its IP below, using syntax {robot_name: [robot_ip, port, 'robot_name']}
    robots: {robot1:[10.8.0.4, 10401, 'alphabot'], robot2:[10.8.0.5, 10402, 'zetabot']}
    ```

- `agent_latency_test.launch` is used to calculate network roundtrip time between agent and server
    ```
    roslaunch server_listener agent_latency_test agent_ip:=64.85.45.54 agent_port:=10401 test_frequency:=80
    ```

    ## `agent_latency_test.launch` configuration options:

    Args | Default | Description
    ------------ | ------------- | -------------
    `agent_ip:=64.85.45.54`|**required**| agent's IP address
    `agent_port:=10401` |**required**| agent port
    `test_frequency:=80`|80| test frequency

## External Package Dependencies
Title | Link
------------ | -------------
roslibpy | [ROS Wiki](https://roslibpy.readthedocs.io/en/latest/)
rospy_message_converter | [ROS Wiki](http://wiki.ros.org/rospy_message_converter)