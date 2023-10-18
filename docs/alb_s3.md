{{home}}

# Load Sample ALB log file from S3-compatible storage

## Purpose
Load ALB logs from and S3-compatible cloud storage bucket.

A minio container will be created to serve up these files.

- See [minio/Dockerfile](../minio/Dockerfile)
- [Test Data](../minio/alb.log)

## Run the scenario
{{start}}

```
docker-compose -f docker-compose.yml -f alb-s3-json-log.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/alb_s3.md in your browser to view these instructions."

```

## Configuration
- See [`alb-s3-json-log.yml`](../alb-s3-json-log.yml)
- See [`logstash/logstash_alb.conf`](../logstash/logstash_alb_s3.conf)

## Explore the Dashboard


- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:'2023-04-01T22:13:27.160Z',to:now))&_a=(columns:!(elb,verb,path,params,response,tags),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:'NOT%20tags:%20_grokparsefailure'),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note that the date has been set to roll back to April 2023
  - Note the designated search and the selected desplay fields


## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f alb-s3-json-log.yml down --volume
```

---
[Back](alb.md) | [Next](tomcat-catalina.md)