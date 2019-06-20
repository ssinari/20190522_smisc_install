#!/bin/bash
set -e
 
# If "-e uid={custom/local user id}" flag is not set for "docker run" command, use 9999 as default
CURRENT_UID=${uid:-1000}
 
# Notify user about the UID selected
echo "Current UID : $CURRENT_UID"
# Create user called "rstudio" with selected UID
useradd --shell /bin/bash -u $CURRENT_UID -o rstudio
# Set "HOME" ENV variable for user's home directory
export HOME=/home/rstudio

# Execute process
exec /usr/sbin/gosu rstudio "$@"
