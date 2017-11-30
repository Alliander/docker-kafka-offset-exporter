FROM alpine:3.6

ENV KAFKA_UID=4321
ENV KAFKA_GID=4321

RUN apk upgrade --update && \
	rm -rf /tmp/* /var/tmp/* /var/cache/apk/* && \
	addgroup -g ${KAFKA_GID} kafka && \
	adduser -D -G kafka -s /bin/bash -u ${KAFKA_UID} kafka && \
	mkdir /app && \
	chown -R kafka:kafka /app

USER kafka

COPY kafka-offset-exporter /app/kafka-offset-exporter

ENTRYPOINT ["/app/kafka-offset-exporter"]