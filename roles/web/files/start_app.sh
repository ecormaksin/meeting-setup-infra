#!/bin/sh

cd `dirname $0`

. ./setenv.sh

java -Duser.language=ja -Duser.country=JP -jar ./meeting-setup.jar --spring.profiles.active=production
