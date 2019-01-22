FROM williamyeh/ansible:debian9-onbuild

RUN apt-get update \
    && apt-get -y --no-install-recommends install apt-transport-https \
                                                  ca-certificates \
                                                  curl \
                                                  gnupg2 \
                                                  software-properties-common \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"
RUN apt-get update \
    && apt-get -y --no-install-recommends install docker-ce-cli \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
