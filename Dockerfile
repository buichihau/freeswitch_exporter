# build
FROM golang:1.18 as builder

RUN git clone https://github.com/mroject/freeswitch_exporter.git

WORKDIR /go/freeswitch_exporter

RUN CGO_ENABLED=0 go build -a -o freeswitch_exporter

# run
FROM scratch

COPY --from=builder /go/freeswitch_exporter /usr/local/bin/

#EXPOSE 9282
#ENTRYPOINT [ "/freeswitch_exporter" ]
