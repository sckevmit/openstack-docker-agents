
Heat and Murano agents for a docker based OpenStack
===================================================

Build and agents
----------------------
::

  sudo docker build -t cloud-init cloud-init
  sudo docker build -t murano-agent murano-agent
  (SRC_DIR=~/code OUT_DIR=/tmp ./heat-agent/build.sh)


How to setup a docker based devstack
------------------------------------

Use dockenstack::

  docker run --privileged -t -i ewindisch/dockenstack


Use Solum vagrant::

  git clone https://github.com/rackerlabs/vagrant-solum-dev.git
  cd vagrant-solum-dev
  vagrant up
  vagrant ssh


How to get the images into glance to be usable
----------------------------------------------
::

  . ~/devstack/openrc admin
  sudo docker save cloud-init | OS_USERNAME=admin glance image-create --is-public=True --container-format=docker --disk-format=raw --name cloud-init
  sudo docker save heat-agent | OS_USERNAME=admin glance image-create --is-public=True --container-format=docker --disk-format=raw --name heat-agent
  sudo docker save murano-agent | OS_USERNAME=admin glance image-create --is-public=True --container-format=docker --disk-format=raw --name murano-agent


Setup your keypair
------------------
::

  cd ~/devstack
  . openrc
  nova keypair-add heat_key > heat_key.priv
  chmod 600 heat_key.priv


Test it out
-----------
Basic user data::

  heat stack-create hello -u https://raw.githubusercontent.com/openstack/heat-templates/master/hot/hello_world.yaml -P "image=cloud-init;key_name=heat_key;admin_pass=Mememe"
