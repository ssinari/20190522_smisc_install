# Purpose

This repo contains:

  - Dockerfile: a docker image that creates an R instance of version 3.6.0 with
  packages "devtools" and "ssinari/smisc" preinstalled. It was created to test
  the installation of "smisc" using devtools::install_github but can be used to
  analyze  data with these packages and R running in a terminal. Works as of
  2019-05-22.
  - build.sh: bash script for building the docker image
  - run.sh: example bash script for running the container.  
