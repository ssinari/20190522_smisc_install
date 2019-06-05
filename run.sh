#!/bin/bash
tag=${2:-"1.0"}
path=${1:-$(pwd)}
#docker pull ssinari/smisc-base:${tag} && \
    docker run --rm \
	   -v ${path}:/home/rstudio/project \
	   -e uid=$UID \
	   --name smisc-base_con \
	   -it smisc-base:${tag} \
	   /bin/bash

