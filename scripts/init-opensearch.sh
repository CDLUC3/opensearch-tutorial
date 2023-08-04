#!/bin/sh

URL=http://admin:admin@opensearch-dashboards:5601
echo $URL
status_code=$(curl --write-out %{http_code} --silent --output /dev/null $URL/app/home)
echo $status_code
sleep 10
while [ $status_code -ne 200 ]
do
  status_code=$(curl --write-out %{http_code} --silent --output /dev/null $URL/app/home)
  echo $status_code
  sleep 2
done
echo "allow content to be loaded before attempting to create an index pattern"
cat > /tmp/indexpattern.json << HERE
{
    "attributes": {
        "title": "ecs-*",
        "timeFieldName": "@timestamp"
    }
}
HERE

status_code=0
for tries in 1 2 3
do
  if [ $status_code -eq 200 -o $status_code -eq 409 ]
  then
    echo
    echo "Skipping ${tries}: ${status_code}"
  else
    sleep 5
    if [ -f /data/saved_objects.ndjson ]
    then
      sleep 10
      IPURL="$URL/api/saved_objects/_import?overwrite=true"
      status_code=$(curl --write-out %{http_code} -H "osd-xsrf: true" -H "securitytenant: Global" -F "file=@/data/saved_objects.ndjson" --silent --output /tmp/log.txt --stderr /tmp/log.txt $IPURL)
    else
      IPURL="$URL/api/saved_objects/index-pattern/ecs-*"
      status_code=$(curl --write-out %{http_code} -H "osd-xsrf: true" -H "Content-Type: application/json" -H "securitytenant: Global" -d "@/tmp/indexpattern.json" --silent --output /tmp/log.txt --stderr /tmp/log.txt $IPURL)
    fi

    echo
    echo
    if [ $status_code -eq 200 ]
    then
      echo 'index pattern imported: ${status_code}'
    else
      echo "index pattern import failed (try ${tries}): ${status_code}"
      echo
      cat /tmp/log.txt
    fi
  fi
done