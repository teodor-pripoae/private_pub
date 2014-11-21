FROM amclain/ruby212
MAINTAINER Teodor Pripoae <toni@kuende.com>

RUN apt-get install -y git

RUN gem install bundler
RUN rbenv rehash

RUN git clone https://github.com/teodor-pripoae/private_pub.git /private_pub
RUN cd /private_pub && rbenv local 2.1.2 && bundle install

ADD run.sh /private_pub/run.sh
WORKDIR /private_pub

CMD ["sh", "/private_pub/run.sh"]

EXPOSE 9292
