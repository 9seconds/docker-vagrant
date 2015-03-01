# Baseimage for Docker-related Vagrant environments


FROM nineseconds/baseimage-vagrant:latest
MAINTAINER Sergey Arkhipov <nineseconds@yandex.ru>

# Update repository lists
RUN apt-add-repository -y ppa:fkrull/deadsnakes && \
    apt-get -qq update && \
    apt-get -qq install -y python2.7 python2.7-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
