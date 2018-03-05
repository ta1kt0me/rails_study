FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y curl ruby-dev libssl-dev make libsqlite3-dev

RUN gem install rake -v '0.8.7' --no-ri --no-rdoc
RUN gem install sqlite3 -v '1.3.13' --no-ri --no-rdoc
RUN gem install rails -v '3.0.20' --no-ri --no-rdoc
RUN gem install pry --no-ri --no-rdoc
RUN gem install pry-debugger --no-ri --no-rdoc

COPY setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
ENTRYPOINT ["/tmp/setup.sh"]
CMD ["rails server"]
