FROM ubuntu-heat-software-config-tar
MAINTAINER Angus Salkeld <asalkeld@mirantis.com>

RUN apt-get update -yqq && apt-get install -yqq supervisor

EXPOSE 22
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD cloud-init-run.sh /tmp/cloud-init-run.sh

CMD ["/usr/bin/supervisord"]
