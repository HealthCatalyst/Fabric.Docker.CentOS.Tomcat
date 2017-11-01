docker stop fabric.docker.centos.tomcat
docker rm fabric.docker.centos.tomcat
docker pull healthcatalyst/fabric.baseos:latest
docker build -t healthcatalyst/fabric.docker.centos.tomcat . 

