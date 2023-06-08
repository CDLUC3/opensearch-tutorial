#!/bin/sh

URL=http://tomcat:8080
curl --silent GET $URL/
curl --silent GET $URL/static/foo.txt
curl --silent GET $URL/static/bar
curl --silent GET $URL/hello.jsp