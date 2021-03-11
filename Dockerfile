FROM ruby:3.0.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq \
    && apt-get install -y build-essential nodejs postgresql-client git yarn cmake nano neovim htop wget tar
WORKDIR /app

RUN gem install bundler --no-document
RUN bundle config git.allow_insecure true
COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle check || bundle install

ENTRYPOINT ["bundle", "exec"]
