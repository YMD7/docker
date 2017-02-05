FROM ruby:2.4.0

ENV APP_ROOT /usr/src/project_name

WORKDIR $APP_ROOT

RUN gem update && \
    gem install --no-ri --no-rdoc rails && \
    gem install bundler && \
    rails -v

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install

