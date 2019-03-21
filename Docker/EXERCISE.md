## Przygotowanie piaskownicy

### git clone https://github.com/djkormo/ContainersSamples.git

### cd ContainersSamples/Docker

### sh ./init-env.sh


## 1) Sprawdzić wersję Dockera

### docker --version

## 2) Sprawdzić listę dostępnych obrazów

### docker images

Wyświetlenie opisu komendy
#### docker help KOMENDA


## 3) Wyświetlenie szczegółów obiektu, np. kontenera


#### docker inspect NAZWA lub HASH


Wyświetlenie aktywnych kontenerów:
#### docker ps

Wyświetlenie wszystkich kontenerów:
#### docker ps -a


## 4. Uruchomienie kontenera na podstawie obrazu

Pobranie obrazu z repozytorium
#### docker pull djkormo/chess-ai

Mapowanie portu  kontenera 8 na port hosta 8989
#### docker run -d -p 8989:80 djkormo/chess-ai

Port hosta zostanie przydzielony automatycznie
#### docker run -d -p 80 djkormo/chess-ai

lista uruchomionych obrazow
#### docker ps 


$ docker ps
>CONTAINER ID        IMAGE                 COMMAND                 CREATED              STATUS              PORTS   NAMES
>47ed748e545b        djkormo/chess-ai      "httpd -D FOREGROUND"   About a minute ago   Up About a minute   0.0.0.0:32768->80/tcp   vigorous_mclean
>053651e5c194        portainer/portainer   "/portainer"            4 minutes ago        Up 4 minutes        0.0.0.0:9000->9000/tcp   portainer
>f1ad183a2c14        djkormo/chess-ai      "httpd -D FOREGROUND"   8 minutes ago        Up 8 minutes        0.0.0.0:8989->80/tcp   epic_booth

Zatrzymanie kontenera pierwszego
#### docker stop 47ed748e545b

Zatrzymanie kontenera drugiego
#### docker stop f1ad183a2c14

Wylistowanie obrazow
#### docker images

>REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
>portainer/portainer   latest              19d07168491a        2 weeks ago         74.1MB
>djkormo/chess-ai      latest              215bb3ea93a7        4 months ago        28.4MB



Usunięcie obrazu 

#### docker rmi 215 (-f)



Budowanie kontenera z obrazu bazowego


#### cd chess-ai/ubuntu/


#### cat Dockerfile


>FROM ubuntu:16.04

>###### author MAINTAINER djkormo
>RUN apt-get clean -qy
>RUN apt-get update -qy

>###### install packages
>RUN apt-get install apache2 git -qy

>######clone content of sample app
>RUN git clone https://github.com/djkormo/simple-chess-ai

>###### copy content to apache root directory
>RUN cd simple-chess-ai && cp -R . /var/www/html/ && cd .. && rm -r simple-chess-ai/
>RUN chmod a+x -R /var/www/html/

>###### running apache
>ENTRYPOINT ["/usr/sbin/apache2ctl","-D","FOREGROUND"]

>###### exposing 80 port
>EXPOSE 80/tcp


Budowanie obrazu na podstawie Dockerfile

#### docker build -t chess-ai:v1 .

Lista obrazow, jak widac pojawiły sie dwa nowe, bazowy i ten pochodny 
#### docker images
REPOSITORY            TAG                 IMAGE ID            CREATED              SIZE
chess-ai              v1                  44fd8342e5ec        About a minute ago   278MB
ubuntu                16.04               9361ce633ff1        9 days ago           118MB
portainer/portainer   latest              19d07168491a        2 weeks ago          74.1MB






