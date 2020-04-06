#!/bin/sh
sudo docker-compose down
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  gcr.io/google-containers/cadvisor:v0.35.0

sudo sysctl -w vm.max_map_count=262144

sudo docker run --name mynginx1 -p 80:80 -d nginx

sudo docker-compose up --scale es01=3 --remove-orphans
