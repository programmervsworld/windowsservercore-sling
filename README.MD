# Windows Container For Apache Sling 8 Development

This is the windowsservercore container loaded with Java 8 and Apache Sling
for development and testing of Sling Applications. While you could use this for production it wasn't 
created with scaling or production environments in mind.

The core image is quite large if you haven't pulled down windowsservercore before. I would strongly recommend
and people running windows 10 pro or server 2016 pull the complete image with:

`docker pull microsoft/windowsservercore`

Before trying to use any build scripts against it.

## Starting
To start it up just use:

`docker run -it -p 8080:8080 programmervsworld/windowsservercore-sling`

Once started you can do to:

`http://<ip>:8080/index.html` and `http://<ip>:8080/system/console`

## Stopping

Just used Ctrl-c a few times until you see it stop and return you to the prompt

## Issues

### Don't know the ip
If you open another powershell console on the host and type:

`docker ps` 

you can find the running instance. Then use the instance id like this:

`docker inspect <instance id>`

Towards the bottom of the inspect you should see the ip address being used by the instance.

### 8080 can't be reached
In some rare cases 8080 will be be blocked at the firewall, if so run:

`netsh advfirewall firewall add rule name="Open Port 8080" dir=in action=allow protocol=TCP localport=8080`

and it should solve the issue.

