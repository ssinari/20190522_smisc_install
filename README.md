# Purpose

This repo contains:

  - Dockerfile: a docker image that creates an R instance of version 3.6.0 with
    packages "devtools" and "ssinari/smisc" preinstalled. It was created to test
    the installation of "smisc" using devtools::install_github but can be used
    to analyze  data with these packages and R running in a terminal. Works as
    of 2019-05-22 .
  - entrypoint.sh: sets up the user "rstudio" in the image with ability to get
    prescribed UID.
  - hooks/build: bash script for building the docker image
  - run.sh: example bash script for running the container.  

# Acknowledgement

This image is inspired by the code in this
[blog](http://www.inanzzz.com/index.php/post/dna6/unning-docker-container-with-a-non-root-user-and-fixing-shared-volume-permissions-with-gosu).
