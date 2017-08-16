FROM alpine:latest

RUN apk update
RUN apk --no-cache add gdbm-dev readline-dev ncurses-dev libffi-dev gcc g++ make zlib-dev perl build-base libc-dev ca-certificates wget postgresql-dev
RUN update-ca-certificates

RUN wget -q -O openssl-0.9.8zh.tar.gz https://www.openssl.org/source/old/0.9.x/openssl-0.9.8zh.tar.gz && tar -zxf openssl-0.9.8zh.tar.gz && rm openssl-0.9.8zh.tar.gz
WORKDIR openssl-0.9.8zh
RUN sed -i -e 's/termio/termios/g' ./crypto/ui/ui_openssl.c
RUN ./config --prefix=/usr/local shared zlib && make && make install
WORKDIR ..

RUN wget -q -O ruby-1.8.7.tar.gz https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.tar.gz && tar -zxf ruby-1.8.7.tar.gz && rm ruby-1.8.7.tar.gz
WORKDIR ruby-1.8.7
RUN ./configure --with-openssl-dir=/usr/local/include/openssl && make && make install
WORKDIR ext/openssl
RUN ruby extconf.rb && make && make install
RUN ruby --version

WORKDIR ../../..
RUN wget -q -O rubygems-v1.3.7.tar.gz https://github.com/rubygems/rubygems/archive/v1.3.7.tar.gz && tar -zxf rubygems-v1.3.7.tar.gz && rm rubygems-v1.3.7.tar.gz
WORKDIR rubygems-1.3.7
RUN ruby setup.rb
RUN gem -v

RUN gem install rake -v '0.8.7' --no-ri --no-rdoc
RUN gem install postgres -v '0.7.9.2008.01.28' --no-ri --no-rdoc
RUN gem install rails -v '1.0.0' --no-ri --no-rdoc --include-dependencies

WORKDIR ..
COPY setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
COPY config/database.yml /tmp/database.yml
COPY db/migrate/001_create_tasks.rb /tmp/001_create_tasks.rb
ENTRYPOINT ["/tmp/setup.sh"]
CMD ["script/server"]
