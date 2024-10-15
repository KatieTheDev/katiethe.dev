#!/bin/sh
USER= #CHANGE ME
HOST= #CHANGE ME
DIR=/var/www/ # CHANGE ME - the directory where your website files should go
hugo && rsync -avz --delete public/ ${USER}@${HOST}:~/${DIR} # this will delete everything on the server that's not in the local public folder 
exit 0