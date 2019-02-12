Example application in Docker.

Flask, Python, Machine learning model with Scikit-Learn



#### Tested at https://labs.play-with-docker.com

git clone https://github.com/djkormo/ContainersSamples.git

cd ContainersSamples/Docker/python-flask-ml-example/


#### Dockerfile based on
#### https://github.com/tiangolo/uwsgi-nginx-docker/tree/master/python3.6

#### building  application from DockerFile

docker build -t my-flask .

#### running the container at 33000 host port 

docker run -d -p 33000:80 my-flask

#### testing from Curl 

curl -d '{"feature_array": [7.3,0.65,0,1.2,0.065,15,21,0.9946,3.39,0.47,10]}' -H "Content-Type: application/json" -X Post  http://localhost:33000/predict

curl -XPOST http://localhost:33000/predict -d '{"feature_array": [7.3,0.65,0,1.2,0.065,15,21,0.9946,3.39,0.47,10]}'

#### testing with Postman


http://localhost:33000/predict

in body  as JSON {application/json}

{"feature_array": [7.3,0.65,0,1.2,0.065,15,21,0.9946,3.39,0.47,10]}


Answer:

{
    "prediction": [
        5.34370699100673
    ]
}



#### TODO adding swagger documentation

http://localhost:33000/api/docs/




Documentation to read:

https://www.datacamp.com/community/tutorials/machine-learning-models-api-python

https://www.bogotobogo.com/python/python-REST-API-Http-Requests-for-Humans-with-Flask.php

https://www.activestate.com/blog/dog-identification-tensorflow-model-python-flask/

https://medium.freecodecamp.org/a-beginners-guide-to-training-and-deploying-machine-learning-models-using-python-48a313502e5a






