{{home}}

# Load Sample ALB log file

## Purpose
Parse and search AWS Application Load Balancer logs using logstash grok filters.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f alb-json-log.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/alb.md in your browser to view these instructions."

```

## Configuration
- See [`alb-json-log.yml`](../alb-json-log.yml)
- See [`logstash/logstash_alb.conf`](../logstash/logstash_alb.conf)
- See [`data/2_sample/alb.log`](../data/2_sample/alb.log)
  - The comments link to an [article](https://medium.com/@sameera.godakanda/alb-access-logs-in-elasticsearch-69b1acaa6b55) illustrating how to construct a grok filter for these AWS logs

## Explore the Dashboard


- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:'2023-04-01T22:13:27.160Z',to:now))&_a=(columns:!(elb,verb,path,params,response,tags),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:'NOT%20tags:%20_grokparsefailure'),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note that the date has been set to roll back to April 2023
  - Note the designated search and the selected desplay fields

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f alb-json-log.yml down --volume
```

---
[Back](sample1_with_json_datenorm.md) | [Next](alb_s3.md)