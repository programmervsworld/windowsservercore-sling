# Windows Container For Apache Sling 8 Development

This is the windowsservercore container loaded with Java 8 and Apache Sling
for development and testing of Sling Applications. While you could use this for production it wasn't 
created with scaling or production environments in mind.

## Starting
To start it up just use:

`docker run -it -p 8080:8080 programmervsworld/windowsservercore-sling`

## Stopping

Just used Ctrl-c a few times until you see it stop and return you to the prompt

