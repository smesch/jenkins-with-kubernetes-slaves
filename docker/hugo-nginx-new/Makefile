.PHONY: all build

DOCKER  = docker
REPO    = smesch
NAME    = hugo-nginx
VERSION = 2.0

all: build

build:
	$(DOCKER) build -t $(NAME) --rm .

tag: build
	$(DOCKER) tag $(NAME) $(REPO)/$(NAME):$(VERSION)

push: tag
	$(DOCKER) push $(REPO)/$(NAME):$(VERSION)
