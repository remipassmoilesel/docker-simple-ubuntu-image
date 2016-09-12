
# Small Docker image and Apache example configuration

Designed to share a server between multiple users. 

First, build it:

	$ git clone https://github.com/remipassmoilesel/simple-ubuntu-docker-image
	$ cd simple-ubuntu-docker-image

Then run it:

	$ docker run -d -p 9010:80 -p 10023:22 ubuntu_prepared 

Thanks to the OpenSSH server you can connect it after:

	$ ssh -p 10023 admin@domain

## Access from outside the server

You can associate a domain name with container by using an Apache proxy. An example is available in the main directory.

	
	Listen 80

	<VirtualHost *:80>

	ServerName somedomain.ddns.net

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	DocumentRoot /var/www/container2

	ProxyVia On
	ProxyRequests Off
	ProxyPreserveHost On

	# Etherpad
	ProxyPass / http://localhost:9010
	ProxyPassReverse / http://localhost:9010

	</VirtualHost>
