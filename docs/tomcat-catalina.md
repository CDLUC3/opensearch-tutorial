{{home}}

# Load Sample Tomcat Catalina log file

## Purpose
Use logstash grok filters to parse Tomcat catalina log files.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f tomcat.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-catalina.md in your browser to view these instructions."

```

## Configuration
- See [`tomcat.yml`](../tomcat.yml)
- See [`logstash/logstash_tomcat.conf`](../logstash/logstash_tomcat.conf)
- Retrieval reqeusts [scripts/tomcat-requests.sh](../scripts/tomcat-requests.sh) that will trigger tomcat log messages

## Explore the Dashboard


- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(level,thread,messageText),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:''),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note that several selected fields have been added to the display

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f tomcat.yml down --volume
```

---
[Back](alb_s3.md) | [Next](tomcat-access.md)