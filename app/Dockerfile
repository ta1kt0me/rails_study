FROM ubuntu:precise

RUN apt-get update
RUN apt-get install -y curl ruby-dev libssl-dev make libsqlite3-dev

RUN curl -sSL https://github.com/rubygems/rubygems/archive/v1.3.7.tar.gz | tar -zxf -
WORKDIR rubygems-1.3.7
RUN ruby setup.rb
RUN gem1.8 -v
RUN cd ..
RUN rm -rf rubygems-1.3.7

RUN gem1.8 install rake -v '0.8.7' --no-ri --no-rdoc
RUN gem1.8 install sqlite3 -v '1.3.13' --no-ri --no-rdoc
RUN gem1.8 install rails -v '3.0.20' --no-ri --no-rdoc --include-dependencies

COPY setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
ENTRYPOINT ["/tmp/setup.sh"]
CMD ["rails server"]
