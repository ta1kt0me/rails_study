FROM ubuntu:precise

RUN apt-get update
RUN apt-get install -y curl ruby-dev libssl-dev libpq-dev make

RUN curl -sSL https://github.com/rubygems/rubygems/archive/v1.3.7.tar.gz | tar -zxf -
WORKDIR rubygems-1.3.7
RUN ruby setup.rb
RUN gem1.8 -v
RUN cd ..
RUN rm -rf rubygems-1.3.7

RUN gem1.8 install rake -v '0.8.7' --no-ri --no-rdoc
RUN gem1.8 install postgres -v '0.7.9.2008.01.28' --no-ri --no-rdoc
RUN gem1.8 install rails -v '2.2.3' --no-ri --no-rdoc --include-dependencies

COPY setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
COPY config/database.yml /tmp/database.yml
ENTRYPOINT ["/tmp/setup.sh"]
CMD ["script/server"]
