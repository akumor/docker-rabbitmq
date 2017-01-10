#!/bin/bash

sleep 30
if [ "$(/usr/sbin/rabbitmqctl list_users | grep -c ${RABBITMQ_ADMIN_USER})" == "0" ]; then
    /usr/sbin/rabbitmqctl add_user ${RABBITMQ_ADMIN_USER} ${RABBITMQ_ADMIN_PASSWORD}
    /usr/sbin/rabbitmqctl set_user_tags ${RABBITMQ_ADMIN_USER} administrator
    /usr/sbin/rabbitmqctl set_permissions -p / ${RABBITMQ_ADMIN_USER} ".*" ".*" ".*"
fi
