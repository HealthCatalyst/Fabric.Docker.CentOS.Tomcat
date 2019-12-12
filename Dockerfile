FROM healthcatalyst/fabric.baseos:latest

LABEL maintainer="Health Catalyst"
LABEL version="1.0"

RUN yum -y install wget

ARG JAVA_VERSION=8u161
RUN wget -O jdk.rpm https://fabricnlpfiles.blob.core.windows.net/java/jdk-${JAVA_VERSION}-linux-x64.rpm \
&& yum install -y ./jdk.rpm \
&& yum clean all \
&& rm -f jdk.rpm

# install tomcat
ARG TOMCAT_VERSION_MAJOR=8
ARG TOMCAT_VERSION=8.5.49
# from https://archive.apache.org/dist/tomcat/tomcat-8/
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
	&& tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /opt \
    && mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/apache-tomcat







