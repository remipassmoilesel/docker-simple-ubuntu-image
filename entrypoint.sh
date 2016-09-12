#/bin/bash

service ssh start

# Startup Apache2 in foreground
apachectl -D FOREGROUND

