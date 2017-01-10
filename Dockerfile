#
# RabbitMQ Dockerfile
#
# https://github.com/dockerfile/rabbitmq
#

# Pull base image.
FROM centos:centos7

# Being the system up to date
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
RUN yum -y update; yum clean all
RUN yum -y install sudo epel-release
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
RUN yum clean all
RUN yum -y install supervisor; yum clean all

# Add files.
ADD bin/create_admin_user.sh /create_admin_user.sh
ADD bin/rabbitmq-start /usr/local/bin/
ADD ./rabbitmq-server-3.3.5-1.noarch.rpm /rabbitmq-server-3.3.5-1.noarch.rpm

# Install RabbitMQ.
RUN \
  yum -y localinstall /rabbitmq-server-3.3.5-1.noarch.rpm && \
  rabbitmq-plugins enable rabbitmq_management && \
  chmod +x /usr/local/bin/rabbitmq-start && \
  chmod +x /create_admin_user.sh

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia
ENV RABBITMQ_ADMIN_USER admin
ENV RABBITMQ_ADMIN_PASSWORD admin

# Define mount points.
VOLUME ["/data/log", "/data/mnesia"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["rabbitmq-start"]

# Expose ports.
EXPOSE 5672
EXPOSE 15672
