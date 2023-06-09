FROM minio/minio

RUN mkdir -p /buckets/bucket/test-logs/

COPY alb.log /buckets/bucket/test-logs/

EXPOSE 9000 9001

CMD [ "minio", "server", "/buckets", "--address", ":9000", "--console-address", ":9001" ]