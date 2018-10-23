# To build the image, start with the following command:
$ docker build -f Dockerfile -t demo/oracle-java:8 .

#To compile your Main.java file.
$ docker run --rm -v $PWD:/app -w /app demo/oracle-java:8 javac Main.java

#To run your compiled Main.class file.
$ docker run --rm -v $PWD:/app -w /app demo/oracle-java:8 java Main