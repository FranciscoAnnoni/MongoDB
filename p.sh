#!/bin/bash




mongod --port 27091 --dbpath /data/db4&

mongod --port 27092 --dbpath /data/db5&

mongod --port 27093 --dbpath /data/db6&
# wait a bit for the first server to come up
sleep 5

# sleep forever
cat
