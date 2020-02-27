#!/bin/bash
#add fix to exercise5-server1 here
ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""
sudo chown vagrant /home/vagrant/.ssh/id_rsa /home/vagrant/.ssh/id_rsa.pub /home/vagrant/.ssh/authorized_keys

cp /home/vagrant/.ssh/id_rsa.pub /vagrant/id_rsa.pub

echo """Host server2
    HostName server2
    User vagrant
    StrictHostKeyChecking no

Host other_server
    HostName other_server
    User vagrant
    StrictHostKeyChecking no
""" > /home/vagrant/.ssh/config