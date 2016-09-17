FROM jenkins:2.7.4
MAINTAINER Steven Eschinger <steven@eschinger.com>

ENV JENKINS_VERSION ${JENKINS_VERSION:-2.7.4}

USER root
RUN apt-get update
USER ${user}

COPY config.xml /usr/share/jenkins/ref/config.xml
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
COPY jenkins-configure-and-start.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/jenkins-configure-and-start.sh"]