FROM  alpine:3.7

RUN apk update && apk upgrade
RUN apk add --no-cache apache2 bash git

RUN mkdir /run/apache2

RUN git clone https://github.com/djkormo/simple-chess-ai

RUN cd simple-chess-ai && cp -R . /var/www/localhost/htdocs/ && cd .. && rm -r simple-chess-ai/


EXPOSE 80/tcp

ENTRYPOINT ["httpd"]
CMD ["-D","FOREGROUND"]