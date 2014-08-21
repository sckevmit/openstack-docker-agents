FROM ubuntu:trusty
MAINTAINER Angus Salkeld <asalkeld@mirantis.com>

RUN apt-get update -yqq && apt-get install -yqq openssh-server sudo cloud-init supervisor language-pack-en

EXPOSE 22
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

RUN mkdir -p /opt; \
  useradd -m -G sudo -s /bin/bash ec2-user &&\
  echo "ec2-user:bookse11er" | chpasswd

ADD ec2-user.sudo /etc/sudoers.d/ec2-user
RUN chown root:root /etc/sudoers.d/ec2-user

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD cloud-init-run.sh /tmp/cloud-init-run.sh

CMD ["/usr/bin/supervisord"]
