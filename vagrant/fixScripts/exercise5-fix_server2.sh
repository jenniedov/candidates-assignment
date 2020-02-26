#!/bin/bash
#add fix to exercise5-server2 here
ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

sudo chown vagrant /home/vagrant/.ssh/id_rsa /home/vagrant/.ssh/id_rsa.pub
cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo apt-get install -y sshpass

echo """Host server1
    HostName server1
    User vagrant
    StrictHostKeyChecking no

Host other_server
    HostName other_server
    User vagrant
    StrictHostKeyChecking no
""" > /home/vagrant/.ssh/config

sudo -u vagrant sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@server1
