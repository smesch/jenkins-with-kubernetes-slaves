FROM ubuntu:latest
MAINTAINER Steven Eschinger <steven@eschinger.com>

ENV HUGO_VERSION=0.19

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install nginx wget git python-pygments -y && \
    wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    cp hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo && \
    rm -rf hugo_${HUGO_VERSION}_linux_amd64/ && \
    hugo new site test && \
    cd test && \
    git clone https://github.com/digitalcraftsman/hugo-material-docs.git themes/hugo-material-docs && \
    cp -a /test/themes/hugo-material-docs/exampleSite/. /test/ && \
    hugo -d /var/www/html/ -b /

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]