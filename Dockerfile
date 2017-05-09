FROM ruby:2.3.4
RUN apt-get update -qq && apt-get install -y build-essential nodejs mysql-client cmake
RUN mkdir /rwx
WORKDIR /rwx
ADD Gemfile /rwx/Gemfile
ADD Gemfile.lock /rwx/Gemfile.lock
RUN bundle install
ADD . /rwx
