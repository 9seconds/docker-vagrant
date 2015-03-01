# Makefile for building base vagrant images
# Basically 'all' target is what you want.


# -----------------------------------------------------------------------------

ROOT_DIR           := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
UBUNTU_DIR         := $(ROOT_DIR)/ubuntu
UBUNTU_PYTHONS_DIR := $(UBUNTU_DIR)/pythons
CENTOS_DIR         := $(ROOT_DIR)/centos
CENTOS_PYTHONS_DIR := $(CENTOS_DIR)/pythons

DOCKER_CMD := docker

NAME_TAG   := nineseconds
IMAGE_TAG  := vagrant
UBUNTU_TAG := $(NAME_TAG)/$(IMAGE_TAG)-ubuntu
CENTOS_TAG := $(NAME_TAG)/$(IMAGE_TAG)-centos

UBUNTU_PYTHONS_TARGETS := $(sort $(dir $(wildcard ubuntu/pythons/*/)))
CENTOS_PYTHONS_TARGETS := $(sort $(dir $(wildcard centos/pythons/*/)))

# -----------------------------------------------------------------------------

all: ubuntu centos

ubuntu: $(UBUNTU_PYTHONS_TARGETS)
	# $(eval IMAGE_27_ID := $(shell $(DOCKER_CMD) images | grep $(UBUNTU_TAG)-python | awk '/2.7/ {print $$3}' | uniq) )
	# $(eval IMAGE_34_ID := $(shell $(DOCKER_CMD) images | grep $(UBUNTU_TAG)-python | awk '/3.4/ {print $$3}' | uniq) )
	# $(DOCKER_CMD) tag -f $(IMAGE_27_ID) $(UBUNTU_TAG)-python:2 && \
	# $(DOCKER_CMD) tag -f $(IMAGE_34_ID) $(UBUNTU_TAG)-python:3 && \
	# $(DOCKER_CMD) tag -f $(IMAGE_27_ID) $(UBUNTU_TAG)-python:latest

centos: $(CENTOS_PYTHONS_TARGETS)
	$(DOCKER_CMD) tag $(shell $(DOCKER_CMD) images | grep $(CENTOS_TAG)-python | awk '/2.7/ {print $$3}') $(CENTOS_TAG)-python:latest

# -----------------------------------------------------------------------------

ubuntu-base:
	$(DOCKER_CMD) build -t $(UBUNTU_TAG) $(UBUNTU_DIR)

$(UBUNTU_PYTHONS_TARGETS): ubuntu-base
	$(DOCKER_CMD) build -t $(UBUNTU_TAG)-python:$(notdir $(@D)) $(ROOT_DIR)/$@
