# based on https://realpython.com/setting-up-a-simple-ocr-server/


from ubuntu:16.04


MAINTAINER  djkormo <djkormo@gmail.com>
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q autoconf automake libtool
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libpng12-dev libjpeg62-dev g++ libtiff4-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libopencv-dev libtesseract-dev git cmake
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q build-essential libleptonica-dev  liblog4cplus liblog4cplus-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libcurl3-dev   
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python2.7-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q tk8.5 tcl8.5 tk8.5-dev tcl8.5-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get apt-get build-dep python-imaging --fix-missing

RUN DEBIAN_FRONTEND=noninteractive apt-get install imagemagick
