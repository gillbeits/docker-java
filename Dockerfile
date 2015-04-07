ROM centos:latest
MAINTAINER Ivan Koretskiy <gillbeits@gmail.com>

RUN yum install -y wget tar
RUN cd /opt
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz"
RUN tar xvf jdk-8u25-linux-x64.tar.gz
RUN chown -R root: jdk1.8.0_25
RUN rm -f jdk-8u25-linux-x64.tar.gz
RUN alternatives --install /usr/bin/java java /opt/jdk1.8.0_25/bin/java 1
RUN alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_25/bin/javac 1
RUN alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_25/bin/jar 1