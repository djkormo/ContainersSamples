FROM ubuntu:16.04

# author MAINTAINER djkormo
RUN apt-get clean -qy
RUN apt-get update -qy

# install packages
RUN apt-get install apache2 git -qy

# clone content of sample app
RUN git clone https://github.com/djkormo/simple-chess-ai

# copy content to apache root directory
RUN cd simple-chess-ai && cp -R . /var/www/html/ && cd .. && rm -r simple-chess-ai/
RUN chmod a+x -R /var/www/html/

# running apache
ENTRYPOINT ["/usr/sbin/apache2ctl","-D","FOREGROUND"]

# exposing 80 port
EXPOSE 80/tcp