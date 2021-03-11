FROM jekyll/builder

COPY --chown=jekyll:jekyll . .
RUN bundle install
RUN mkdir /out
RUN jekyll build --destination /out

FROM nginx:1.18-alpine
COPY --from=0 /out/_site /usr/share/nginx/html
