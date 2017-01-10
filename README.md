## RabbitMQ Dockerfile


This repository contains **Dockerfile** of [RabbitMQ](http://www.rabbitmq.com/) for [Docker](https://www.docker.com/) on CentOS 7.


### Base Docker Image

* [docker-rabbitmq](http://)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Build an image from Dockerfile: `docker build --rm -t <yourname>/docker-rabbitmq .`


### Usage

#### Run `rabbitmq-server`

    docker run -d -p 5672:5672 -p 15672:15672 <yourname>/docker-rabbitmq

#### Run 'rabbitmq-server' w/ non-default admin:admin credentials

    docker run -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_ADMIN_USER=<admin username> -e RABBITMQ_ADMIN_PASSWORD=<admin password> <yourname>/docker-rabbitmq

#### Run `rabbitmq-server` w/ persistent shared directories.

    docker run -d -p 5672:5672 -p 15672:15672 -v <log-dir>:/data/log -v <data-dir>:/data/mnesia <yourname>/docker-rabbitmq
