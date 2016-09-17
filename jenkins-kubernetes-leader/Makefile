.PHONY: all build

DOCKER  = docker
REPO    = smesch
NAME    = jenkins-kubernetes-leader
VERSION = 2.7.4

all: build

build:
	$(DOCKER) build -t $(NAME) --rm .

tag: build
	$(DOCKER) tag $(NAME) $(REPO)/$(NAME):$(VERSION)

push: tag
	$(DOCKER) push $(REPO)/$(NAME):$(VERSION)
