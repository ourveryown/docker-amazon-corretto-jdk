FROM centos

ARG JAR_FILE
ENV JAVA_VERSION 1.8.0_232
ENV BUILD_VERSION b09-1

ARG JAVA_OPTS
ENV JAVA_OPTS=${JAVA_OPTS}

RUN mkdir -p /app/gateway-service/logs/archive

# Upgrading system
RUN yum -y upgrade
RUN yum -y install wget

# Downloading & Config Java 8
RUN wget --no-cookies --no-check-certificate "https://d3pxv6yz143wms.cloudfront.net/8.232.09.1/java-1.8.0-amazon-corretto-devel-1.8.0_232.b09-1.x86_64.rpm" -O /tmp/jdk-8-linux-x64.rpm
RUN yum -y install /tmp/jdk-8-linux-x64.rpm
RUN alternatives --install /usr/bin/java java /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

