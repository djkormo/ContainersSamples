# based on https://realpython.com/setting-up-a-simple-ocr-server/


from ubuntu:16.04


MAINTAINER  djkormo <djkormo@gmail.com>
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty   main universe" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu trusty  main restricted" >> /etc/apt/sources.list
RUN echo "deb-src http://gb.archive.ubuntu.com/ubuntu/ trusty restricted main universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://gb.archive.ubuntu.com/ubuntu/ trusty-updates restricted main universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://gb.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://security.ubuntu.com/ubuntu trusty-security restricted main universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://gb.archive.ubuntu.com/ubuntu/ trusty-proposed restricted main universe multiverse" >> /etc/apt/sources.list

RUN cat /etc/apt/sources.list

RUN apt-get -y update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils perl-base perl  wget 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y  autoconf automake libtool libc6-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libpng12-dev libjpeg62-dev g++ #libtiff4-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libopencv-dev libtesseract-dev git cmake
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q build-essential libleptonica-dev  #liblog4cplus liblog4cplus-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libcurl3-dev   
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python2.7-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q tk8.5 tcl8.5 tk8.5-dev tcl8.5-dev
RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get build-dep -y python-imaging --fix-missing

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y imagemagick


RUN wget http://www.leptonica.org/source/leptonica-1.70.tar.gz
RUN tar -zxvf leptonica-1.70.tar.gz
RUN cd leptonica-1.70/
RUN ./autobuild
RUN ./configure
RUN make
RUN sudo make install
RUN sudo ldconfig