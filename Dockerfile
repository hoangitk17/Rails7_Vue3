# syntax=docker/dockerfile:1
FROM node:18.19.1 as node
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/bin/npm /usr/local/bin/npm
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /opt/yarn-* /opt/yarn
RUN ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn

WORKDIR /myapp

# COPY package.json yarn.lock /myapp/
RUN yarn install --check-files

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Định nghĩa path lưu các gem được cài đặt
ENV BUNDLE_PATH=/bundle \
        BUNDLE_BIN=/bundle/bin \
        GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]