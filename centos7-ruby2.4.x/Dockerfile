FROM ymd7/centos7-rbenv

RUN yum -y update

RUN rbenv install 2.4.1
RUN rbenv global 2.4.1
RUN rbenv exec gem install bundler
RUN rbenv rehash

ENV PATH /root/.rbenv/versions/2.4.1/bin:$PATH
