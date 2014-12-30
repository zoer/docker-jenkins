FROM jenkins

USER root
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

RUN \
  curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` \
    > /usr/local/bin/fig && chmod +x /usr/local/bin/fig

# Timezone
RUN \
  echo "Europe/Moscow" > /etc/timezone; \
  dpkg-reconfigure -f noninteractive tzdata

# Install vagrant
ENV VAGRANT_VERSION 1.7.1
RUN \
  cd /tmp && \
  wget https://dl.bintray.com/mitchellh/vagrant/vagrant_${VAGRANT_VERSION}_x86_64.deb \
    -qO vagrant.deb && \
  dpkg -i vagrant.deb && rm vagrant.deb

USER jenkins
