FROM ruby:2.7
RUN gem update --system
WORKDIR /usr/src/app
COPY . .
RUN bundle install
RUN jekyll build

FROM nginx:1.18-alpine
COPY --from=0 /usr/src/app/_site /usr/share/nginx/html
