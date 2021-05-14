
import logging
import time

import roslibpy

fmt = '%(asctime)s %(levelname)8s: %(message)s'
logging.basicConfig(format=fmt, level=logging.INFO)
log = logging.getLogger(__name__)

client = roslibpy.Ros(host='mihy.tech', port=10101)

def receive_message(msg):
    age = int(time.time() * 1000) - msg['data']
    log.info('Age of message: %6dms', age)

publisher = roslibpy.Topic(client, '/alphabot_latency', 'std_msgs/UInt64')
publisher.advertise()

subscriber = roslibpy.Topic(client, '/alphabot_latency', 'std_msgs/UInt64')
subscriber.subscribe(receive_message)

def publish_message():
    publisher.publish(dict(data=int(time.time() * 1000)))
    client.call_later(.5, publish_message)

client.on_ready(publish_message)
client.run_forever()