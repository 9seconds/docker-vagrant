# Baseimage for Docker-related Vagrant environments


FROM nineseconds/vagrant-ubuntu:latest
MAINTAINER Sergey Arkhipov <nineseconds@yandex.ru>

# Update repository lists
RUN apt-get -qq update && \
    apt-get -qq install -y python2.7 python2.7-dev python-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install --upgrade pip || true
RUN pip install --no-cache-dir virtualenv
