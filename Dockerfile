FROM ubuntu:14.04

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y python-software-properties \
    && apt-get install -y software-properties-common debconf-utils

RUN apt-get install -y openssh-server
RUN apt-get install -y xauth xorg openbox
RUN apt-get install -y libswt-gtk-3-java 

RUN wget -c https://download.jetbrains.com/idea/ideaIC-2017.2.1.tar.gz
RUN tar zxvf ideaIC-2017.2.1.tar.gz

RUN wget -c http://download.gluonhq.com/scenebuilder/8.3.0/install/linux/scenebuilder-8.3.0.deb
RUN dpkg -i scenebuilder-8.3.0.deb

RUN cd ideaIC-2017.2.1/bin
RUN ./idea.sh

