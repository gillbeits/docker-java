FROM centos:latest
MAINTAINER Ivan Koretskiy <gillbeits@gmail.com>

ENV RUNTIME jdk
ENV VERSION 7
ENV UPDATE 75
ENV BUILD 13

RUN yum install -y wget tar
RUN cd /opt \
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
        "http://download.oracle.com/otn-pub/java/jdk/${VERSION}u${UPDATE}-b${BUILD}/${RUNTIME}-${VERSION}u${UPDATE}-linux-x64.tar.gz" \
    && tar xvf ${RUNTIME}-${VERSION}u${UPDATE}-linux-x64.tar.gz \
    && rm -f ${RUNTIME}-${VERSION}u${UPDATE}-linux-x64.tar.gz \
    && chown -R root: ${RUNTIME}1.${VERSION}.0_${UPDATE}

ENV JAVA_HOME /opt/${RUNTIME}1.${VERSION}.0_${UPDATE}

RUN alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1
RUN alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 1
RUN alternatives --install "/usr/bin/jar" "jar" "${JAVA_HOME}/bin/jar" 1