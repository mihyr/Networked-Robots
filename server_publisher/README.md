# server_publisher Package

## Overview
This package uses `server_slam` and `server_listener` package and completes entire workflow pipeline to fetch, compute and publish data back to the robot.

## Launch file usage Instructions

- `publisher.launch` launches `front_end_service` node from `server_slam` package which maintains entire server's workflow as a service
- `publisher.launch` also includes `rosbridge_server` which publishes topics back to the robot

    ```
    roslaunch server_publisher publisher.launch server_port:=9090 local_port:=9090
    ```

    ## `publisher.launch` configuration options:

    Args | Default | Description
    ------------ | ------------- | -------------
    `local_port:=9090`|**required**| server's Local rosbridge websocket port
    `server_port:=9090` |**required**| server's external port, as configured in server's IP route table

- `map_manager.launch` uses `map_server` package to save robot's map in desired folder. The launch file is used by `front_end_service` node and manages folder structure and naming of each map based on inputs mentioned in the table below

    ```
    roslaunch server_publisher map_manager.launch robot_name:=alphabot map_name:=alphabot_10.8.0.4 latitude:=42.0839424 longitude:=-87.7068288 folder:= alphabot
    ```

    ## `map_manager.launch` configuration options:

    Args | Default | Description
    ------------ | ------------- | -------------
    `save_merged_map:=false`|`false`| save global map
    `save_robot_map:=true` |`true`|  save individual robot's map
    `map_name:=no_name` |**required**|  name of the map
    `robot_name:=true` |**required**|  name of the robot
    `latitude:=no_name` |**required**|  latitude (GPS)
    `longitude:=true` |**required**|  longitude (GPS)
    `folder:=no_name` |**required**|  folder location to save map



## External Package Dependencies
Title | Link
------------ | -------------
map_server| [Github](https://github.com/SteveMacenski/slam_toolbox)