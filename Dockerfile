FROM healthcatalyst/fabric.baseos:latest

LABEL maintainer="Health Catalyst"
LABEL version="1.0"

RUN yum -y install wget

RUN wget -O jdk.rpm https://fabricnlpfiles.blob.core.windows.net/java/jdk-7u80-linux-x64.rpm \
&& yum install -y ./jdk.rpm \
&& yum clean all \
&& rm -f jdk.rpm

# install tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.81/bin/apache-tomcat-7.0.81.tar.gz \
	&& tar -xvf apache-tomcat-7.0.81.tar.gz -C /opt \
    && mv /opt/apache-tomcat-7.0.81 /opt/apache-tomcat







