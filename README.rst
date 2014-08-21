
Heat and Murano agents for a docker based OpenStack
===================================================

Build the Murano agent
----------------------

  sudo docker build -t cloud-init cloud-init
  sudo docker build -t murano-agent murano-agent


Build the Heat agent
--------------------

  (SRC_DIR=~/code OUT_DIR=/tmp ./heat-agent/build.sh)


How to setup a docker based devstack
------------------------------------

Use dockenstack:

  docker run --privileged -t -i ewindisch/dockenstack


Use Solum vagrant:

  git clone https://github.com/rackerlabs/vagrant-solum-dev.git
  cd vagrant-solum-dev
  vagrant up
  vagrant ssh

How to get the images into glance to be usable
----------------------------------------------
