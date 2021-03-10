FROM jekyll/jekyll

COPY --chown=jekyll:jekyll . .
RUN bundle install
RUN jekyll build

FROM nginx:1.18-alpine
COPY --from=0 /srv/jekyll/_site /usr/share/nginx/html
