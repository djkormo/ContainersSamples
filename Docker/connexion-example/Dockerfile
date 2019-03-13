FROM python:3.6-slim

ADD classifier /classifier

COPY requirements.txt .

COPY app.py .

COPY swagger.yaml .

#RUN pip install –upgrade pip

RUN pip install -r requirements.txt

EXPOSE 8080

CMD python3 ./app.py