FROM jekyll/builder
WORKDIR /out

COPY --chown=jekyll:jekyll . .
RUN bundle install
RUN jekyll build

FROM nginx:1.18-alpine
COPY --from=0 /out/_site /usr/share/nginx/html
