#!/bin/sh

URL=http://admin:admin@$HOSTNAME.$DOMAIN:8094
status_code=$(curl --write-out %{http_code} --silent --output /dev/null $URL/app/home)
echo $status_code
sleep 2
while [ $status_code -ne 200 ]
do
  status_code=$(curl --write-out %{http_code} --silent --output /dev/null $URL/app/home)
  echo $status_code
  sleep 2
done
echo "allow content to be loaded before attempting to create an index pattern"
sleep 10
curl --silent -X POST \
  -H "osd-xsrf: true" \
  $URL/api/saved_objects/_import?overwrite=true \
  --form file=@/tmp/export.ndjson
echo
echo 'index pattern imported'