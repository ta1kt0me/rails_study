FROM alpine:latest

RUN apk --no-cache add openssl gcc g++ make
RUN wget -q -O ruby-1.8.7.tar.gz https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.tar.gz && tar -zxf ruby-1.8.7.tar.gz && rm ruby-1.8.7.tar.gz
WORKDIR ruby-1.8.7
RUN ./configure
RUN make
RUN make install
RUN ruby --version
