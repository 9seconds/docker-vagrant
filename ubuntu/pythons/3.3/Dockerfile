# Baseimage for Docker-related Vagrant environments


FROM nineseconds/vagrant-ubuntu:latest
MAINTAINER Sergey Arkhipov <nineseconds@yandex.ru>

# Update repository lists
RUN apt-add-repository -y ppa:fkrull/deadsnakes && \
    apt-get -qq update && \
    apt-get -qq install -y python3.3-complete && \
    ln -s /usr/bin/python3.3 /usr/bin/python && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sL https://bootstrap.pypa.io/ez_setup.py | python
RUN curl -sL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
RUN pip install --upgrade --no-cache-dir virtualenv
