#!/bin/sh
sudo docker-compose down


sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)

sudo sysctl -w vm.max_map_count=262144
sudo docker-compose up --scale es01=2 --remove-orphans
