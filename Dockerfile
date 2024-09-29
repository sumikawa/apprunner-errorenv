FROM ruby:3.2-alpine

RUN gem install rackup sinatra

COPY server.rb .

EXPOSE 4567

CMD ["ruby", "server.rb"]
