FROM cloud-init
MAINTAINER Angus Salkeld <asalkeld@mirantis.com>

RUN apt-get install -yqq git unzip make cmake gcc python-dev python-pip

RUN mkdir -p /opt/git
RUN mkdir -p /var/murano/plans
RUN git clone https://github.com/stackforge/murano-agent.git /opt/git/murano-agent
WORKDIR /opt/git/murano-agent
RUN git checkout release-0.5
WORKDIR /opt/git/murano-agent/python-agent
RUN chmod a+x setup*.sh
RUN ./setup.sh install

ADD murano_agent_super.conf /etc/supervisor/conf.d/
