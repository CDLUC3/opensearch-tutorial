FROM minio/minio

# https://stackoverflow.com/questions/72904999/create-minio-docker-image-with-content
COPY --from=docker.io/minio/mc:latest /usr/bin/mc /usr/bin/mc

RUN mkdir -p /buckets/bucket/ /tmp/data/test-logs/

COPY alb.log /tmp/data/test-logs/

RUN minio server /buckets & \
    server_pid=$!; \
    until mc alias set local http://localhost:9000 minioadmin minioadmin; do \
        sleep 1; \
    done; \
    mc cp --recursive /tmp/data/* local/bucket; \
    kill $server_pid

EXPOSE 9000 9001

CMD [ "minio", "server", "/buckets", "--address", ":9000", "--console-address", ":9001" ]