FROM golang:1.9.2-stretch

RUN go get github.com/echojc/kafka-offset-exporter && \
	cd /go/src/github.com/echojc/kafka-offset-exporter && \
	go install

ENTRYPOINT ["/go/bin/kafka-offset-exporter"]