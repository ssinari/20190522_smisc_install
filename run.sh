#!/bin/bash
tag=${1:-"1.0"}
docker pull ssinari/smisc-base:${tag} && \
    docker run --rm \
	   -v ${path}:/home/rstudio/project \
	   -it ssinari/smisc-base:${tag}


