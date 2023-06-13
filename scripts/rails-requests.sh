#!/bin/sh

URL=http://rails:3000
sleep 2
curl --silent GET $URL/
curl --silent GET $URL/foo
curl --silent GET $URL/hello
curl --silent GET $URL/not_found
