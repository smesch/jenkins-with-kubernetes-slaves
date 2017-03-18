FROM alpine:latest
MAINTAINER Steven Eschinger <steven@eschinger.com>

ENV KUBECTL_VERSION=1.5.4
ENV HUGO_VERSION=0.19

USER root

RUN apk add --update \
    wget \
    ca-certificates \
    jq \
    git \
    docker

RUN wget https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/bin/kubectl

RUN wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    cp hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo && \
    rm -rf hugo_${HUGO_VERSION}_linux_amd64/