#https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one


[ $(vagrant plugin list | grep vagrant-hostmanager | wc -l) != 1 ] && vagrant plugin install vagrant-hostmanager 
[ $(vagrant plugin list | grep vagrant-vbguest | wc -l) != 1 ] && vagrant plugin install vagrant-vbguest

vagrant up

vagrant ssh -- -t  "sudo sh /etc/cleanup.x.sh"

vagrant package  --output /d/openkube-ubuntu-xenial64.box

vagrant box add /d/openkube-ubuntu-xenial64.box --name openkube-ubuntu-xenial64
