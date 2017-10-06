FROM centos:centos7
MAINTAINER Health Catalyst <imran.qureshi@healthcatalyst.com>

## Set a default user. Available via runtime flag `--user docker` 
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (for rstudio or linked volumes to work properly). 
RUN useradd docker \
	&& mkdir -p /home/docker \
	&& chown docker:docker /home/docker
 
RUN yum -y update; yum clean all \
    && yum -y install java-1.7.0-openjdk-devel dos2unix which; yum clean all

# install tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.81/bin/apache-tomcat-7.0.81.tar.gz \
	&& tar -xvf apache-tomcat-7.0.81.tar.gz -C /opt \
    && mv /opt/apache-tomcat-7.0.81 /opt/apache-tomcat

ADD https://healthcatalyst.github.io/InstallScripts/wait-for-it.sh ./wait-for-it.sh

RUN chmod a+x /wait-for-it.sh

