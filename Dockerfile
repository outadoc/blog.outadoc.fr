FROM jekyll/jekyll

COPY --chown=jekyll:jekyll . .

RUN bundle install

CMD ["jekyll", "serve"]
