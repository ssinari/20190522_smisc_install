#!/bin/bash
path=${1:-$(pwd)}
tag=${2:-"1.0"}
docker pull ssinari/smisc-base:${tag} && \
    docker run --rm \
	   -v ${path}:/home/rstudio/project \
	   -e uid=$UID \
	   --name smisc-base_con \
	   -it ssinari/smisc-base:${tag} \
	   /bin/bash

