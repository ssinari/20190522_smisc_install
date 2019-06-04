FROM ssinari/rockers-base:1.0
MAINTAINER Shripad Sinari
LABEL Description="Image used for running R in bash shell with smisc package preinstalled."    
ARG WHEN
ARG WHEN
RUN R -e "options(repos = \
  list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/${WHEN}')); \
  library('devtools'); \
  install_github(\"ssinari/smisc\")"

RUN  R -e "library(BiocManager); \
           BiocManager::install(c(\"biomaRt\" \
                                , \"genefilter\"))"

ARG UID
RUN useradd -ms /bin/bash \
    -u ${UID} rstudio && \
    echo "rstudio:rstudio" | chpasswd && \
    adduser rstudio sudo

WORKDIR /home/rstudio
RUN mkdir project; chown -R rstudio:rstudio project
VOLUME ["/home/rstudio/project"]
USER rstudio


ENTRYPOINT ["/bin/bash"]
