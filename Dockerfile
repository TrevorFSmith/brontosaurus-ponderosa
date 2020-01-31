
FROM golang:alpine AS builder
ADD ./go/src ./go/src
ADD ./Makefile .
RUN apk add --update make
RUN set -ex && \
	make tools && \
	mv ./go/bin/*ponderosa* /usr/bin/

FROM alpine
RUN apk add --update ca-certificates
COPY --from=builder /usr/bin/*ponderosa* /usr/local/bin/
ENTRYPOINT [ "/usr/local/bin/brontosaurus-ponderosa" ]
