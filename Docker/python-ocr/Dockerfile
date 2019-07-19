# based on https://realpython.com/setting-up-a-simple-ocr-server/


from ubuntu:16.04


MAINTAINER  djkormo <djkormo@gmail.com>

COPY repos.txt .

RUN cat  repos.txt >> /etc/apt/sources.list

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
#RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get build-dep -y python-imaging --fix-missing

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y imagemagick


RUN wget http://www.leptonica.org/source/leptonica-1.78.0.tar.gz
RUN tar -zxvf leptonica-1.78.0.tar.gz
RUN cd leptonica-1.78.0/
WORKDIR "/leptonica-1.78.0"
RUN  ./autogen.sh
RUN  ./configure
RUN make
RUN make install
RUN ldconfig

WORKDIR "/"

#RUN wget https://tesseract-ocr.googlecode.com/files/tesseract-ocr-3.02.02.tar.gz
RUN wget https://github.com/tesseract-ocr/tesseract/archive/3.05.02.tar.gz
RUN tar -zxvf 3.05.02.tar.gz

WORKDIR "/tesseract-3.05.02"
RUN ls -la
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN ldconfig


