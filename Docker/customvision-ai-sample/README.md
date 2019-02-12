### Model generated at https://www.customvision.ai/

#### Tested at https://labs.play-with-docker.com

git clone https://github.com/djkormo/ContainersSamples.git

cd ContainersSamples/Docker/customvision-ai-sample/


How to build:
==============================================

docker build -t  customvision-ai .

How to run locally:
==============================================
docker run -p 127.0.0.1:33000:80 -d custiomvision-a



Then use your favorite tool to connect to the end points.

POST http://127.0.0.1:33000/image with multipart/form-data using the imageData key
e.g
	curl -X POST http://127.0.0.1:33000/image -F imageData=@some_file_name.jpg

POST http://127.0.0.1:33000/image with application/octet-stream
e.g.
	curl -X POST http://127.0.0.1:33000/image -H "Content-Type: application/octet-stream" --data-binary @some_file_name.jpg



For information on how to use these files to create and deploy through AzureML check out the readme.txt in the azureml directory.


Some pictures saved in images directory.


Examples:

curl -X POST http://127.0.0.1:33000/image -F imageData=@images/kot1.jpg


{
  "created": "2019-02-12T07:39:42.690093",
  "id": "",
  "iteration": "",
  "predictions": [
    {
      "boundingBox": null,
      "probability": 1.0,
      "tagId": "",
      "tagName": "kot"
    }
  ],
  "project": ""
}

curl -X POST http://127.0.0.1:33000/image -F imageData=@images/kot1.jpg

{
  "created": "2019-02-12T07:39:42.690093",
  "id": "",
  "iteration": "",
  "predictions": [
    {
      "boundingBox": null,
      "probability": 1.0,
      "tagId": "",
      "tagName": "kot"
    }
  ],
  "project": ""
}


$ curl -X POST http://127.0.0.1:33000/image -F imageData=@images/pies1.jpeg
{
  "created": "2019-02-12T07:41:09.736361",
  "id": "",
  "iteration": "",
  "predictions": [
    {
      "boundingBox": null,
      "probability": 1.0,
      "tagId": "",
      "tagName": "pies"
    }
  ],
  "project": ""
}



$ curl -X POST http://127.0.0.1:33000/image -F imageData=@images/pies2.jpg
{
  "created": "2019-02-12T07:41:39.338584",
  "id": "",
  "iteration": "",
  "predictions": [
    {
      "boundingBox": null,
      "probability": 1.0,
      "tagId": "",
      "tagName": "pies"
    }
  ],
  "project": ""
}
[node1] (local) root@192.168.0.58 ~/ContainersSamples/Docker/customvision-ai-sample


