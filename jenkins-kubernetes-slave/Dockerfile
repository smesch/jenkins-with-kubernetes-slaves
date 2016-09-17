FROM jenkinsci/jnlp-slave:latest
MAINTAINER Steven Eschinger <steven@eschinger.com>

USER root
RUN curl -sSL https://get.docker.com/ | sed 's/docker-engine/docker-engine=1.11.2-0~jessie/' | sh
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN apt-get install sudo

COPY launch.sh /
VOLUME ["/var/run/docker.sock"]

ENTRYPOINT ["/launch.sh"]