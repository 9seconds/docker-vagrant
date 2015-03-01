# Baseimage for Docker-related Vagrant environments


FROM nineseconds/vagrant-ubuntu:latest
MAINTAINER Sergey Arkhipov <nineseconds@yandex.ru>

# Update repository lists
RUN apt-add-repository -y ppa:fkrull/deadsnakes && \
    apt-get -qq update && \
    apt-get -qq install -y python3.1-complete && \
    ln -s /usr/bin/python3.1 /usr/bin/python && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
