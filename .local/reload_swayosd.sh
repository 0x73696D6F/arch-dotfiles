#!/bin/bash
killall -9 swayosd-server
sleep 0.5
swayosd-server &
disown
