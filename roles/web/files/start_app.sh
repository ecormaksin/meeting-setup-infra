#!/bin/sh

cd `dirname $0`

. ./setenv.sh

java -jar ./meeting-setup.jar
