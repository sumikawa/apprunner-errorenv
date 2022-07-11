FROM ruby:2.7-alpine

RUN gem install sinatra

COPY server.rb .

EXPOSE 4567

CMD ["ruby", "server.rb"]
