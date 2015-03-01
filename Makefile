# Makefile for building base vagrant images
# Basically 'all' target is what you want.


# -----------------------------------------------------------------------------

ROOT_DIR           := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
UBUNTU_DIR         := $(ROOT_DIR)/ubuntu
UBUNTU_PYTHONS_DIR := $(UBUNTU_DIR)/pythons
CENTOS_DIR         := $(ROOT_DIR)/centos

DOCKER_CMD := docker

NAME_TAG   := nineseconds
IMAGE_TAG  := baseimage-vagrant
UBUNTU_TAG := $(NAME_TAG)/$(IMAGE_TAG)-ubuntu
CENTOS_TAG := $(NAME_TAG)/$(IMAGE_TAG)-centos

UBUNTU_PYTHONS_TARGETS := $(sort $(dir $(wildcard ubuntu/pythons/*/)))

all: ubuntu centos
ubuntu: $(UBUNTU_PYTHONS_TARGETS)

ubuntu-base:
	$(DOCKER_CMD) build -t $(UBUNTU_TAG) $(UBUNTU_DIR)

$(UBUNTU_PYTHONS_TARGETS): ubuntu-base
	$(DOCKER_CMD) build -t $(UBUNTU_TAG)-python:$(notdir $(@D)) $(ROOT_DIR)/$@

