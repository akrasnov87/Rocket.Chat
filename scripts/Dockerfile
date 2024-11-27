# создан на основе apps/meteor/.docker/Dockerfile.debian

ARG DENO_VERSION="1.37.1"
FROM denoland/deno:bin-${DENO_VERSION} AS deno

FROM debian:11-slim AS build

ARG DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC
ARG METEOR_VERSION=3.0.4

LABEL author="Aleksandr Krasnov"
LABEL desc="Rocket.Chat"

RUN apt update && \
    apt upgrade -y && \
    apt install g++ build-essential git python3 curl unzip -y

# nvm env vars
RUN mkdir -p /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
# IMPORTANT: set the exact version
ENV NODE_VERSION v20.18.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use --delete-prefix $NODE_VERSION"
# add node and npm to the PATH
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/bin
ENV PATH $NODE_PATH:$PATH

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn -y

COPY --from=deno /deno /bin/deno
RUN curl https://install.meteor.com/?release=$METEOR_VERSION | sh
COPY . /build

# исправлен баг со сборкой в 7.0.0
RUN cd /build/apps/meteor/node_modules/rocketchat-services
RUN yarn add -D @types/node@20
# исправлен баг со сборкой в 7.0.0

RUN cd /build && yarn && yarn build
RUN cd /build/apps/meteor && meteor build --allow-superuser --directory /tmp

FROM node:20.18.0-bullseye-slim

LABEL maintainer="vonsark87@yandex.ru"

# dependencies 
RUN groupadd -g 65533 -r rocketchat \
    && useradd -u 65533 -r -g rocketchat rocketchat \
    && mkdir -p /app/uploads \
    && chown rocketchat:rocketchat /app/uploads \
    && apt-get update \
    && apt-get install -y --no-install-recommends fontconfig

COPY --from=deno /deno /bin/deno
COPY --from=build /tmp/bundle /app/bundle

# --chown requires Docker 17.12 and works only on Linux
ADD --chown=rocketchat:rocketchat . /app

# needs a mongoinstance - defaults to container linking with alias 'mongo'
ENV DEPLOY_METHOD=docker \
    NODE_ENV=production \
    MONGO_URL=mongodb://mongo:27017/rocketchat \
    HOME=/tmp \
    PORT=3000 \
    ROOT_URL=http://localhost:3000 \
    Accounts_AvatarStorePath=/app/uploads

RUN aptMark="$(apt-mark showmanual)" \
    && apt-get install -y --no-install-recommends g++ make python3 ca-certificates \
    && apt-mark auto '.*' > /dev/null \
    && apt-mark manual $aptMark > /dev/null

# USER rocketchat

RUN cd /app/bundle/programs/server \
    && npm install \
    && cd npm/node_modules/isolated-vm \
    && npm install \
    && npm cache clear --force

# USER root

RUN find /usr/local -type f -executable -exec ldd '{}' ';' \
    | awk '/=>/ { print $(NF-1) }' \
    | sort -u \
    | xargs -r dpkg-query --search \
    | cut -d: -f1 \
    | sort -u \
    | xargs -r apt-mark manual \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

RUN chown -R rocketchat:rocketchat /app

USER rocketchat

VOLUME /app/uploads

WORKDIR /app/bundle

EXPOSE 3000

CMD ["node", "main.js"]
