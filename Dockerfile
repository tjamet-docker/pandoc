FROM alpine AS dl
RUN wget -O pandoc.tgz https://github.com/jgm/pandoc/releases/download/2.1.3/pandoc-2.1.3-linux.tar.gz
RUN tar xf pandoc.tgz
RUN apk add --no-cache ca-certificates
FROM alpine
COPY --from=dl /pandoc-2.1.3/bin/pandoc /pandoc
COPY --from=dl /usr/share/ca-certificates /usr/share/ca-certificates
COPY --from=dl /etc/ssl/certs /etc/ssl/certs
ENTRYPOINT ["/pandoc"]
