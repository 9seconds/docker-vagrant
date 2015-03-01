# Baseimage for Docker-related Vagrant environments


FROM nineseconds/vagrant-ubuntu:latest
MAINTAINER Sergey Arkhipov <nineseconds@yandex.ru>

# Update repository lists
RUN apt-get -qq update && \
    apt-get -qq install -y python3.4 python3.4-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
