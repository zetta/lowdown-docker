FROM alpine:3.13.1 as builder

RUN apk add --no-cache gcc musl-dev make
COPY . .
RUN ./configure && \
  ls -lah && \
  make && \
  make regress && \
  make install

FROM alpine:3.13.1
COPY --from=builder /usr/local/bin/lowdown /usr/local/bin/lowdown
CMD ["/usr/local/bin/lowdown"]
