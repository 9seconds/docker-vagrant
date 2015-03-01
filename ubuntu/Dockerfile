# Baseimage for Docker-related Vagrant environments


FROM phusion/baseimage:latest
MAINTAINER Sergey Arkhipov <nineseconds@yandex.ru>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN echo "/root" > /etc/container_environment/HOME && \
    echo "noninteractive" > /etc/container_environment/DEBIAN_FRONTEND && \
    echo "linux" > /etc/container_environment/TERM && \
    rm -f /etc/service/sshd/down && \
    /usr/sbin/enable_insecure_key && \
    /etc/my_init.d/00_regen_ssh_host_keys.sh

# Update repository lists
RUN apt-get update

# Install necessary packages
RUN apt-get -qq install -y --no-install-recommends \
    git \
    vim \
    nano \
    curl \
    wget

# Add Vagrant key
RUN mkdir -p /root/.ssh && \
    curl -sL https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /root/.ssh/authorized_keys

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/sbin/my_init", "--"]
