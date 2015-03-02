# Makefile for building base vagrant images
# Basically 'all' target is what you want.


# -----------------------------------------------------------------------------

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

DOCKER_CMD := docker

NAME_TAG  := nineseconds
IMAGE_TAG := $(NAME_TAG)/docker-vagrant

# -----------------------------------------------------------------------------

all: ubuntu

ubuntu:
	$(DOCKER_CMD) build -t $(IMAGE_TAG) $(ROOT_DIR)
