# Baseimage for Docker-related Vagrant environments


FROM phusion/baseimage:latest
MAINTAINER Sergey Arkhipov <nineseconds@yandex.ru>

# Environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Do common baseimage actions
RUN echo "/root" > /etc/container_environment/HOME && \
    echo "noninteractive" > /etc/container_environment/DEBIAN_FRONTEND && \
    echo "linux" > /etc/container_environment/TERM && \
    rm -f /etc/service/sshd/down && \
    /usr/sbin/enable_insecure_key && \
    /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install necessary packages
RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
        git \
        vim \
        nano \
        curl \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add Vagrant key
RUN mkdir -p /root/.ssh && \
    curl -sL https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /root/.ssh/authorized_keys

# Cleanups
RUN rm -rf /tmp/* /var/tmp/*

# Init process is entrypoint
ENTRYPOINT ["/sbin/my_init", "--"]
