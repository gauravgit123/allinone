# Pull in Docker hun or ubuntu image download
FROM ubuntu:latest

# Creater file name
MAINTAINER "gauravkhandate@gmail.com"

# Update lib and install minimal application
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim
RUN apt-get -y install openssh-server
RUN apt-get -y install git

# Create folder 
RUN mkdir -p /opt/download/extract
RUN mkdir -p /opt/download/extract/java
RUN mkdir -p /opt/download/extract/maven
RUN mkdir -p /opt/download/extract/tomcat
WORKDIR /opt/download/

# Download minimal file of maven,java and tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
ADD https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz .
COPY jdk-11.0.19_linux-x64_bin.tar.gz .
RUN tar -zxf apache-tomcat-9.0.78.tar.gz
RUN tar -zxf apache-maven-3.9.4-bin.tar.gz
RUN tar -zxf jdk-11.0.19_linux-x64_bin.tar.gz
RUN mv -f apache-tomcat-9.0.78/* /opt/download/extract/tomcat
RUN mv -f apache-maven-3.9.4/* /opt/download/extract/maven
RUN mv -f jdk-11.0.19/* /opt/download/extract/java
WORKDIR /

# Configure the Envierment of java and maven 
ENV JAVA_HOME /opt/download/extract/java
ENV M2_HOME /opt/download/extract/maven
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH

# Creatting mvn webapp project script
RUN mkdir /Script
WORKDIR /Script
COPY create_mvn_folder.sh .
ADD git_add.sh .
WORKDIR /
