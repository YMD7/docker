FROM ruby:2.4.0

ENV APP_ROOT /usr/src/sewingbooks

WORKDIR $APP_ROOT

RUN \
  echo 'install: --no-document' >> ~/.gemrc && \
	echo 'update: --no-document' >> ~/.gemrc

COPY . /usr/src/sewingbooks

RUN bundle install

EXPOSE 3000

