FROM alpine:latest

RUN apk --no-cache add openssl gcc g++ make
RUN wget -q -O ruby-1.8.7.tar.gz https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.tar.gz && tar -zxf ruby-1.8.7.tar.gz && rm ruby-1.8.7.tar.gz
WORKDIR ruby-1.8.7
RUN ./configure
RUN make
RUN make install
RUN ruby --version

WORKDIR ..
RUN wget -q -O rubygems-v2.6.12.tar.gz https://github.com/rubygems/rubygems/archive/v2.6.12.tar.gz && tar -zxf rubygems-v2.6.12.tar.gz && rm rubygems-v2.6.12.tar.gz
WORKDIR rubygems-2.6.12
RUN ruby setup.rb
RUN gem -v
