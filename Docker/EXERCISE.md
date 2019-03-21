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


