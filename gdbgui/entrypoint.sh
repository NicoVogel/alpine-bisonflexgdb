#!/bin/ash

# start gdbgui
gdbgui -r &

# generate ssh key
ssh-keygen -A

# start ssh
exec /usr/sbin/sshd -D