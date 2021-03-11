FROM ruby:2.5

WORKDIR /usr/src/app

COPY --chown=jekyll:jekyll . .
RUN bundle install
RUN jekyll build

FROM nginx:1.18-alpine
COPY --from=0 /usr/src/app/_site /usr/share/nginx/html
