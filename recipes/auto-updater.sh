#!/bin/bash

#
# Make sure we won't override something!
#
if [ -f /home/root/scripts/autoupdater.sh ]; then
    printf "\n"
    echo "Error!"
    printf "\n"
    echo "File already exists:"
    echo "/home/root/scripts/autoupdater.sh"
    printf "\n"
    echo "Aborting ..."
    printf "\n"
    exit 1
fi

#
# Make a required directory if it's not existent yet
#
mkdir -p /home/root/scripts

#
# Add a shell script for automatically updating an ubuntu server
#
cat >/home/root/scripts/autoupdater.sh <<EOF
#!/bin/bash
apt-get update
apt-get -yt $(lsb_release -cs)-security dist-upgrade
apt-get -d dist-upgrade
apt-get autoclean
EOF

#
# Apply the required access rights
#
chmod 700 /home/root/scripts/autoupdater.sh

#
# Write some output for the forge log mailer
#
printf "\n"
echo "If you don't see any errors in the output your new autoupdater is available to be ran from:"
echo "/home/root/scripts/autoupdater.sh (as root user)"
printf "\n\n"
echo "Here are the contents of the autoupdater:"
printf "\n"
cat /home/root/scripts/autoupdater.sh
printf "\n\n"
echo "You can now simply setup a cronjob for this script using the Forge UI."
echo "Feel free to apply any changes to suite your needs."
printf "\n"
echo "Credits: http://wiki.ubuntuusers.de/apt/apt-get"
printf "\n"