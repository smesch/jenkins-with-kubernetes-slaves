.PHONY: all build

DOCKER  = docker
REPO    = smesch
NAME    = jenkins-kubernetes-slave
VERSION = latest

all: build

build:
	$(DOCKER) build -t $(NAME) --rm .

tag: build
	$(DOCKER) tag $(NAME) $(REPO)/$(NAME):$(VERSION)

push: tag
	$(DOCKER) push $(REPO)/$(NAME):$(VERSION)
