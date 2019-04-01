#!/bin/ash

# start VNC
/usr/bin/supervisord -c /etc/supervisord.conf &

# generate ssh key
ssh-keygen -A

# start ssh
exec /usr/sbin/sshd -D