FROM ssinari/rockers-base:1.0
MAINTAINER Shripad Sinari
LABEL Description="Image used for running R in bash shell with smisc package preinstalled."    
RUN set -eux; \
	apt-get update; \
	apt-get install -y gosu; \
	rm -rf /var/lib/apt/lists/*; \
	## verify that the binary works
	gosu nobody true

ARG WHEN
RUN R -e "options(repos = \
  list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/${WHEN}')); \
  library('devtools'); \
  install_github(\"ssinari/smisc\")"

RUN  R -e "library(BiocManager); \
           BiocManager::install(c(\"biomaRt\" \
                                , \"genefilter\"))"
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

