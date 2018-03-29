FROM healthcatalyst/fabric.baseos:latest

LABEL maintainer="Health Catalyst"
LABEL version="1.0"

RUN yum -y install wget

RUN wget -O jdk.rpm https://fabricnlpfiles.blob.core.windows.net/java/jdk-8u152-linux-x64.rpm \
&& yum install -y ./jdk.rpm \
&& yum clean all \
&& rm -f jdk.rpm

# install tomcat
ARG tomcatmajorversion=8
ARG tomcatversion=8.5.9
# from https://archive.apache.org/dist/tomcat/tomcat-8/
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-${tomcatmajorversion}/v${tomcatversion}/bin/apache-tomcat-${tomcatversion}.tar.gz \
	&& tar -xvf apache-tomcat-${tomcatversion}.tar.gz -C /opt \
    && mv /opt/apache-tomcat-${tomcatversion} /opt/apache-tomcat







