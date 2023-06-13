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

{{dashboard}}
- [Browse rails](http://{{MYHOSTNAME}}:8080/)
- Add the following **Available Fields** to the display
  - json_data.method
  - json_data.path
  - json_data.status

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f rails.yml down --volume
```

---
[Home](../README.md)