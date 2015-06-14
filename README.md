# Docker Teamspeak3 Server

This is a Dockerfile to deploy TeamSpeak3 Server.

## How to run

Here's how you can run the container :

```
docker run --restart=always --name ts3server -d -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -v /etc/localtime:/etc/localtime:ro -v /<local-directory-for-db-files>:/data fgracia/ts3server
```

Where :

* **--restart=always** : allows to automatically restart the container if it stops, of if the host reboots (optional)
* **--name ts3server** : you can choose the name you want
* **-d** : daemon mode
* **-p 9987:9987/udp -p 10011:10011 -p 30033:30033** : maps the default ports
* **-v /etc/localtime:/etc/localtime:ro** : sets the UTC like the host (optional)
* **-v /local-directory-for-db-files:/data** : if you want persistent data files, you can choose a local directory (optional)

If you use post-processing actions, you may need to mount other data volumes.


## Docker Compose

Because of an hard docker run command to remember, you can use docker-compose (see the YAML script in the compose folder). 
You will juste have to adapt data volumes and then run :

```
docker-compose up -d
```
