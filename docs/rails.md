[Home](../README.md)

---

# Load Sample Rails log files

## Under Construction

- https://nicolasiensen.github.io/2022-02-01-creating-a-new-rails-application-with-docker/

## Purpose
Generate Ruby on Rails logs in ECS format for use in OpenSearch

## Configuration

## Run the scenario

If running locally...
```
export MYHOSTNAME=$(hostname)
```

If running on a server...
```
export MYHOSTNAME=$(hostname).$(domainname)
```

Start the docker stack
```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-all-logs.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-all-logs.md in your browser to view these instructions."

```

1. Navigate to the Rails Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)
2. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant

Run the following to stop the stack.

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-all-logs.yml down --volume
```

---
[Home](../README.md)