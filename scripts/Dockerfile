ARG DENO_VERSION="1.37.1"
FROM denoland/deno:bin-${DENO_VERSION} AS deno

FROM debian:11-slim AS build

ARG DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC
ARG METEOR_VERSION=2.16

LABEL author="Aleksandr Krasnov"
LABEL desc="Rocket.Chat"

RUN apt update && \
    apt upgrade -y && \
    apt install g++ build-essential git curl python3 curl unzip -y

COPY scripts/setup_14.x.sh /setup_14.x.sh
RUN sed -i 's/\r//g' /setup_14.x.sh && \
    /bin/bash /setup_14.x.sh

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn -y

COPY --from=deno /deno /bin/deno
RUN curl https://install.meteor.com/?release=$METEOR_VERSION | sh
COPY . /build
RUN cd /build && yarn && yarn build
RUN cd /build/apps/meteor && meteor build --allow-superuser --directory /tmp

FROM node:14.21.3-bullseye-slim

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
#ADD --chown=rocketchat:rocketchat . /app

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
    && cd /app/bundle/programs/server \
    && npm install \
    && cd npm/node_modules/isolated-vm \
    && npm install \
    && apt-mark auto '.*' > /dev/null \
    && apt-mark manual $aptMark > /dev/null \
    && find /usr/local -type f -executable -exec ldd '{}' ';' \
    | awk '/=>/ { print $(NF-1) }' \
    | sort -u \
    | xargs -r dpkg-query --search \
    | cut -d: -f1 \
    | sort -u \
    | xargs -r apt-mark manual \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && npm cache clear --force

RUN chown -R rocketchat:rocketchat /app

USER rocketchat

VOLUME /app/uploads

WORKDIR /app/bundle

EXPOSE 3000

CMD ["node", "main.js"]
