FROM ymd7/centos7-ruby:2.4.1

ENV APP_ROOT /usr/src/watir

WORKDIR $APP_ROOT

RUN gem install watir
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
RUN yum -y install fontconfig-devel
RUN phantomjs -v
