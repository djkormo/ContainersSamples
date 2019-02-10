FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . ../

