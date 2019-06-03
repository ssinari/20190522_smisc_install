FROM rockers-base:latest
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    sudo \
    less \
    libssl-dev \
    git \
    libssl-dev \
    libssh2-1-dev \
    libxml2-dev \
    zlib1g-dev \
    libcurl4-gnutls-dev
    
ARG WHEN
RUN R -e "options(repos = \
  list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/${WHEN}')); \
  library('devtools'); \
  install_github(\"ssinari/smisc\")"
  
RUN useradd -ms /bin/bash analyst && echo "analyst:123456" | chpasswd && adduser analyst sudo
USER analyst
WORKDIR /home/analyst
CMD /bin/bash
