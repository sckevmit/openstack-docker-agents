#!/bin/bash

SRC_DIR=${SRC_DIR:-~/work}
OUT_DIR=${OUT_DIR:-~/Downloads}

build_tar() {
pushd $SRC_DIR
for proj in diskimage-builder tripleo-image-elements heat-templates; do
    if [ -d $proj ]; then
        echo "existing $proj"
    else
        git clone https://git.openstack.org/openstack/$proj.git
    fi
done
export ELEMENTS_PATH=tripleo-image-elements/elements:heat-templates/hot/software-config/elements
diskimage-builder/bin/disk-image-create vm \
        ubuntu selinux-permissive \
        heat-config \
        os-collect-config \
        os-refresh-config \
        os-apply-config \
        heat-config-cfn-init \
        heat-config-puppet \
        heat-config-script \
        -t tar -o $OUT_DIR/ubuntu-software-config.tar
popd
}

if [ ! -f $OUT_DIR/ubuntu-software-config.tar ]; then
  build_tar
else
  echo "found $OUT_DIR/ubuntu-software-config.tar"
fi

sudo docker import - ubuntu-heat-software-config-tar < $OUT_DIR/ubuntu-software-config.tar
sudo docker build -t ubuntu-heat-software-config .
echo docker run -ti  ubuntu-heat-software-config /bin/bash
