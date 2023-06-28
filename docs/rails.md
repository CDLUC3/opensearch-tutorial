{{home}}
# Load Sample Rails log files

## Purpose
Generate Ruby on Rails logs in ECS format for use in OpenSearch.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f rails.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/rails.md in your browser to view these instructions."

```
## Configuration

- Minimal Rails App
  - [blog post describing the creation of a minimal rails app](https://nicolasiensen.github.io/2022-02-01-creating-a-new-rails-application-with-docker/)
  - [rails/Dockerfile](../rails/Dockerfile)
  - [rails/lograge.rb](../rails/lograge.rb)
  - [rails/routes.rb](../rails/routes.rb)
  - [rails/app/controllers/myapp_controller.rb](../rails/app/controllers/myapp_controller.rb)
- [rails.yml](../rails.yml)
- [logstash/logstash_rails.conf](../logstash/logstash_rails.conf)

## Explore the Dashboard

- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(json_data.method,json_data.path,json_data.message,json_data.status,json_data.duration),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:''),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note that several fields have been added to the display
- [Browse rails](http://{{MYHOSTNAME}}:8080/)

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f rails.yml down --volume
```

---
[Back](tomcat-all-logs.md) | [Home](../README.md)