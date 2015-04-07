FROM centos:latest
MAINTAINER Ivan Koretskiy <gillbeits@gmail.com>

RUN yum install -y wget tar
RUN cd /opt
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jre-7u71-linux-x64.tar.gz"
RUN tar xvf jre-7u71-linux-x64.tar.gz
RUN rm -f jre-7u71-linux-x64.tar.gz
RUN chown -R root: jre1.7.0_71
RUN alternatives --install /usr/bin/java java /opt/jre1.7.0_71/bin/java 1