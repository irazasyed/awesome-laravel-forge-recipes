#!/bin/bash

NGINX_CONF_PATH="/etc/nginx/conf.d"
BLOCKIPS_FILENAME="$NGINX_CONF_PATH/blockips.conf"

if [ -f $BLOCKIPS_FILENAME ]; then
    printf "\n"
    echo "Error!"
    printf "\n"
    echo "File already exists:"
    echo $BLOCKIPS_FILENAME
    printf "\n"
    echo "Aborting ..."
    printf "\n"
    exit 1
fi

cat >$BLOCKIPS_FILENAME <<EOF
# Block IP Address
# deny 1.1.1.1;
EOF

#
# Write some output for the forge log mailer
#
printf "\n"
echo "If you don't see any errors in the output your new ip blocker is available!"
printf "\n\n"
echo "Here are the contents of the IP Blocker:"
printf "\n"
cat $BLOCKIPS_FILENAME
printf "\n\n"
printf "\n"