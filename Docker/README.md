Sample Dockerfile for simple applications

Go to:
https://labs.play-with-docker.com/

Login with your dockerhub account

You have 4 hours to play with docker.

Add new instance.


CHESS

Run example container:

docker run -d -p 80 djkormo/chess-ai

Click on blue link above.

Something like this 
http://ip172-18-0-64-bf7dinav9dig00eis9s0-32768.direct.labs.play-with-docker.com/

Play chess and have fun.


CAMUNDA 

Camunda BPM platform demo:

docker pull camunda/camunda-bpm-platform:latest

docker run -d --name camunda -p 8080:8080 camunda/camunda-bpm-platform:latest

Click on  blue link and add /camunda-welcome/index.html


For example: 

http://ip172-18-0-64-bf7dinav9dig00eis9s0-8080.direct.labs.play-with-docker.com/camunda-welcome/index.html


The default credentials for admin access to the webapps is:

    Username: demo
    Password: demo
	
	
Tips

Clipboard

Shift+Insert > Paste
Ctrl+Insert -> Copy
	
Using SSH 
Copy link (for example):

ip172-18-0-153-bho03hcpkul000cmfqk0@direct.labs.play-with-docker.com	

Use in putty (port 22) with your generated private key  in putty generator.
-------------
Using username "ip172-18-0-153-bho03hcpkul000cmfqk0".
Authenticating with public key "rsa-key-20190222"
Connecting to 40.121.62.105:8022
###############################################################
#                          WARNING!!!!                        #
# This is a sandbox environment. Using personal credentials   #
# is HIGHLY! discouraged. Any consequences of doing so are    #
# completely the user's responsibilites.                      #
#                                                             #
# The PWD team.                                               #
###############################################################
[node1] (local) root@192.168.0.53 ~
$

-----------
	
Installing portainer on 9000 port


docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer	
	

	