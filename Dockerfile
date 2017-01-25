# This Dockerfile builts a Sling Development server on windowsservercore. Any items you wish to run still need
# to be deployed using Maven or Alternative options.
FROM microsoft/windowsservercore

MAINTAINER programmervsworld@gmail.com

# Install And Display Java 8
RUN powershell (new-object System.Net.WebClient).Downloadfile('http://javadl.oracle.com/webapps/download/AutoDL?BundleId=210185', 'C:\jre-8u91-windows-x64.exe')
RUN powershell start-process -filepath C:\jre-8u91-windows-x64.exe -passthru -wait -argumentlist "/s,INSTALLDIR=c:\Java\jre1.8.0_91,/L,install64.log"
RUN del C:\jre-8u91-windows-x64.exe

# Download A Java8 Compatible Version Of Sling Using PowerShell
RUN powershell mkdir C:\apache-sling
RUN powershell (new-object System.Net.WebClient).Downloadfile('http://www-us.apache.org/dist/sling/org.apache.sling.launchpad-8.jar', 'C:\apache-sling\org.apache.sling.launchpad-8.jar')

# Exposing only 8080 (Normal Web and WebDAV Ports) and 30303 (For Starting In Debug Mode)
EXPOSE 8080
EXPOSE 30303

CMD cd C:\apache-sling && c:\\Java\\jre1.8.0_91\\bin\\java.exe -jar org.apache.sling.launchpad-8.jar