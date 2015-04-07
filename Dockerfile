FROM centos:latest
MAINTAINER Ivan Koretskiy <gillbeits@gmail.com>

RUN yum install -y wget tar
RUN cd /opt
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jre-8u25-linux-x64.tar.gz"
RUN tar xvf jre-8u25-linux-x64.tar.gz
RUN rm -f jre-8u25-linux-x64.tar.gz
RUN chown -R root: jre1.8.0_25
RUN alternatives --install /usr/bin/java java /opt/jre1.8.0_25/bin/java 1