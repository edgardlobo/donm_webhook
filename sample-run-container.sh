#!/bin/bash

# confira o seu ip usando ifconfig docker0|grep 'inet addr:'
export DOCKER_LAN_IP=$(ifconfig docker0 | grep 'inet addr:' | awk '{ split($2,a,":"); print a[2] }')

# porta que será feito o bind
export LISTEN_PORT=8181

docker run --name donm-chatbot \
 -p $DOCKER_LAN_IP:$LISTEN_PORT:8080 \
 --cpu-shares=512 \
 --memory 1800m -dit appcivico/donm-chatbot