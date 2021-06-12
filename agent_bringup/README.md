# Agent Bringup Package

## Overview
This package helps robot to connect to the server. This package is to be deloyed on turtlebot.

### Nodes List
Node | Description
------------ | -------------
gps| reads GPS data from ttyUSB0 port and publishes `navsatfix` ros messages
time | publish NTP time as `UInt64` ros message which is used by the server to determine latency
server_latency_test| takes server ip, port args and calculates network roundtrip time between agent and server

## Launch file usage Instructions

- `core_bringup.launch` is the main launch to be used on the robot. This launch file includes turtlebot3 launch files as well.
- To launch turtlebot core packages and connect to the server, use
    ```
    roslaunch agent_bringup core_bringup.launch onboard_slam:=true slam_toolbox:=false local_port:=10401 server_port:=9090
    ```

    ## `core_bringup.launch` configuration options:

    Args | Default | Description
    ------------ | ------------- | -------------
    `local_port:=10401`|`true`| Local rosbridge websocket port
    `server_port:=9090` |`true`| external port, as configured in server's IP route table
    `publish_time:=true` |`false`| publish NTP time locally (used by server to calculate latency)
    `GPS:=true`|`true`| publish GPS messages locally
    `onboard_slam:=true`|`false`| Optionally run Slam_tolbox onboard and send only `/map` topic
    `sync_mode:=true`|`false`| mode for slam_toolbox
    `navigation:=true` |`false`| Optionally launch turtlebot3 navigation stack

- `onboard_slam.launch` optionally allows to run slam nodes on the robot itself and send only /map topic to the server.
    This launch file is included in `core_bringup.launch`

    ## `onboard_slam.launch` configuration options:

    Args | Default | Description
    ------------ | ------------- | -------------
    `sync_mode:=true`|`false`| mode for slam_toolbox
    `navigation:=true` |`false`| Optionally launch turtlebot3 navigation stack

- `server_latency_test.launch` is used to calculate network roundtrip time between agent and server
    ```
    roslaunch agent_bringup server_latency_test server_ip:=64.85.45.54 server_port:=10401 test_frequency:=80
    ```

    ## `server_latency_test.launch` configuration options:

    Args | Default | Description
    ------------ | ------------- | -------------
    `server_ip:=64.85.45.54`|`false`| server's IP address
    `server_port:=10401` |`false`| server port
    `test_frequency:=80`|`true`| test frequency

## Package Dependencies
Title | Link
------------ | -------------
turtlebot3_bringup | [ROS Wiki](http://wiki.ros.org/turtlebot3_bringup)
slam_toolbox | [ROS Wiki](http://wiki.ros.org/slam_toolbox)
turtlebot3_navigation | [ROS Wiki](http://wiki.ros.org/turtlebot3_navigation)
rosbridge_server | [ROS Wiki](http://wiki.ros.org/rosbridge_server)