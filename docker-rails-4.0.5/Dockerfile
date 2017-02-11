FROM ruby:2.4.0

RUN gem update && \
    gem install --no-ri --no-rdoc rails -v 4.0.5 && \
    gem install bundler && \
    rails -v

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install

