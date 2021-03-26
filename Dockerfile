FROM ruby:2

LABEL maintainer="Michael Maffait"
LABEL org.opencontainers.image.source https://github.com/Pandemonium1986/docker-jekyll

RUN gem install jekyll bundler
RUN mkdir -p /opt/jekyll

WORKDIR /opt/jekyll

RUN git clone https://github.com/jglovier/resume-template.git /opt/jekyll && \
    bundle install && \
    bundle exec jekyll build

CMD ["bundle", "exec", "jekyll", "serve", "--watch", "-H", "0.0.0.0"]
