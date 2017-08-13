FROM ubuntu:14.04

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y python-software-properties \
    && apt-get install -y software-properties-common debconf-utils \
    && add-apt-repository -y ppa:webupd8team/java \
    && apt-get update \
    && echo "oracle-java9-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections \
    && echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections \
    && apt-get install -y oracle-java9-installer \
    && apt-get install -y oracle-java9-set-default 

RUN apt-get install -y openssh-server

ADD root/.bashrc /root/.bashrc

# criar as variáveis de ambiente
ENV PATH $PATH:/
ENV JAVA_HOME /usr/lib/jvm/java-9-oracle
ENV CLASSPATH /usr/lib/jvm/java-9-oracle/lib

RUN apt-get install -y ubuntu-gnome-desktop
RUN apt-get install -y tightvncserver

#RUN vncserver 
