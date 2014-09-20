#!/bin/bash

SHELL_SCRIPTS_PATH="/home/root/scripts"
CF_AUTOUPDATER_FILENAME="$SHELL_SCRIPTS_PATH/cf-ip-autoupdater.sh"

if [ -f $CF_AUTOUPDATER_FILENAME ]; then
    printf "\n"
    echo "Error!"
    printf "\n"
    echo "File already exists:"
    echo "$CF_AUTOUPDATER_FILENAME"
    printf "\n"
    echo "Aborting ..."
    printf "\n"
    exit 1
fi

#
# Make a required directory if it's not existent yet
#
mkdir -p $SHELL_SCRIPTS_PATH

#
# Add a shell script for automatically updating an ubuntu server
#
wget --no-check-certificate -cqO $CF_AUTOUPDATER_FILENAME http://lk.gd/1qV2f6s

#
# Apply the required access rights
#
chmod a+x $CF_AUTOUPDATER_FILENAME

#
# Write some output for the forge log mailer
#
printf "\n"
echo "If you don't see any errors in the output your new cf ip autoupdater is available to be ran from:"
echo "$CF_AUTOUPDATER_FILENAME (as root user)"
printf "\n\n"
echo "Here are the contents of the cloudflare ip range autoupdater:"
printf "\n"
cat $CF_AUTOUPDATER_FILENAME
printf "\n\n"
echo "You can now simply setup a cronjob for this script."
echo "Feel free to apply any changes to suite your needs."
printf "\n"