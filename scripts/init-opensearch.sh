#!/bin/sh

URL=http://admin:admin@$MYHOSTNAME:8094
echo $URL
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
cat > /tmp/indexpattern.json << HERE
{
    "attributes": {
        "title": "ecs-*",
        "timeFieldName": "@timestamp"
    }
}
HERE

IPURL="$URL/api/saved_objects/index-pattern/ecs-*"
curl -H "osd-xsrf: true" -H "Content-Type: application/json" -H "securitytenant: Global" -d "@/tmp/indexpattern.json" $IPURL

echo
echo 'index pattern imported'