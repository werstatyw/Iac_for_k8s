#firts let's create option to not to use passwd for sudo on control ansible machine
echo 'ansible ALL=(ALL) NOPASSWD:ALL' >/tmp/sudoers
#then let's copy this file to the right place on the control host:
sudo cp /tmp/sudoers /etc/sudoers.d/ansible