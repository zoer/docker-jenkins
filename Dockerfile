FROM jenkins

USER root
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins
