FROM ruby:2.4.0

ENV WORK /usr/src/rails

WORKDIR $WORK

COPY Gemfile $WORK
COPY Gemfile.lock $WORK

RUN \
  echo 'install: --no-document' >> ~/.gemrc && \
	echo 'update: --no-document' >> ~/.gemrc

RUN bundle install

