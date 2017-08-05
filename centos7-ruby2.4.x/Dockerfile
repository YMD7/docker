FROM ymd7/centos7-rbenv

RUN RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/include/readline"
RUN rbenv install 2.4.1
RUN rbenv global 2.4.1
RUN rbenv exec gem install bundler
RUN rbenv rehash

ENV PATH $PATH:/root/.rbenv/versions/2.4.1/bin
