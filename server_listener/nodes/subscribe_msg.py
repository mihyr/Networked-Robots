from __future__ import print_function
import roslibpy

client = roslibpy.Ros(host='mihy.tech', port=10101)
client.run()

listener = roslibpy.Topic(client, '/imu', 'sensor_msgs/Imu')
listener.subscribe(lambda message: print('Alphabot:/Imu ' + message['data']))

try:
    while True:
        pass
except KeyboardInterrupt:
    client.terminate()