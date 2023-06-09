[Home](../README.md)

---

# Load Sample Tomcat Access log file

- See [`tomcat-access.yml`](../tomcat-access.yml)
- See [`logstash/logstash_tomcat_access.conf`](../logstash/logstash_tomcat_access.conf)

Start the Stack

If running locally...
```
export MYHOSTNAME=$(hostname)
```

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-access.yml up -d --build
echo "Open http://${MYHOSTNAME:-$(hostname).$(domainname)}:8086/ in your browser to view these instructions."

```

1. Navigate to the Tomcat Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)
2. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`

Run the following to stop the stack.

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-access.yml down --volume
```
