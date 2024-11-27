<p align="center"> 
  <img  src="https://github.com/RocketChat/Rocket.Chat.Artwork/raw/master/Logos/2020/png/logo-horizontal-red.png" data-canonical-src="https://github.com/RocketChat/Rocket.Chat.Artwork/raw/master/Logos/2020/png/logo-horizontal-red.png" width="400" />
</p>

<h1 align="center">
  The ultimate Free Open Source Solution for team communications
</h1>

<p align="center">
  <img src="https://img.shields.io/github/v/release/RocketChat/Rocket.Chat?label=version">
  <img src="https://img.shields.io/github/actions/workflow/status/RocketChat/Rocket.Chat/build_and_test.yml">
  <img src="https://img.shields.io/badge/license-MIT-green">
  <img alt="Codecov branch" src="https://img.shields.io/codecov/c/github/RocketChat/Rocket.Chat/develop">
</p>



[Rocket.Chat](https://rocket.chat) is an open-source fully customizable communications platform developed in JavaScript for organizations with high standards of data protection.

We are the ultimate **Free Open Source Solution** for team communications, enabling real-time conversations between colleagues, with other companies or with your customers, regardless of how they connect with you. The result is an increase in productivity and customer satisfaction rates.

Every day, tens of millions of users in over 150 countries and in organizations such as Deutsche Bahn, The US Navy, and Credit Suisse trust Rocket.Chat to keep their communications completely private and secure.

# 🚀 Product Offerings - Self Hosted and Cloud

Rocket.Chat has four key product offerings: 

💬 **Team collaboration** - A single point for secure internal and cross-company collaboration.

🎯 **Omnichannel customer service** - Engage in seamless interactions with customers regardless of how they connect with you.

🦾 **Chat engine** - Create customized messaging experiences within your mobile or web app.

🤖 **Marketplace** - Choose a wide range of apps and native integrations that help your business communicate more effectively.

<img src="https://global-uploads.webflow.com/611a19b9853b7414a0f6b3f6/6319c72bbd8af5c8c22efab6_heroImage.webp" data-canonical-src="https://global-uploads.webflow.com/611a19b9853b7414a0f6b3f6/6319c72bbd8af5c8c22efab6_heroImage.webp"  />

# ☁️ Cloud Hosted Rocket.Chat

Send your first message in minutes.

Free for 30 days. Afterward, choose between continuing to host on our secure cloud or migrating to your private cloud, data center, or even air-gapped environment.

[Start your cloud hosted trial now](https://rocket.chat/trial-saas)

# 🛠️ Local development

##  Prerequisites

You can follow these instructions to setup a dev environment:

- Install **Node 20.x (LTS)** either [manually](https://nodejs.org/dist/latest-v20.x/) or using a tool like [nvm](https://github.com/creationix/nvm) or [volta](https://volta.sh/) (recommended)
- Install **Meteor** ([version here](apps/meteor/.meteor/release)): https://docs.meteor.com/about/install.html
- Install **yarn**: https://yarnpkg.com/getting-started/install
- Install **Deno 1.x**: https://docs.deno.com/runtime/fundamentals/installation/
- Clone this repo: `git clone https://github.com/RocketChat/Rocket.Chat.git`
- Run `yarn` to install dependencies

**Starting Rocket.Chat:**

```bash
yarn dev # run all packages
```
OR
```bash
yarn dsv # run only meteor (front and back) with pre-built packages
```

After initialized, you can access the server at http://localhost:3000

More details at: [Developer Docs](https://developer.rocket.chat/v1/docs/server-environment-setup)
PS: For Windows you MUST use WSL2 and have +12Gb RAM


# Gitpod Setup

1. Click the button below to open this project in Gitpod.

2. This will open a fully configured workspace in your browser with all the necessary dependencies already installed.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/RocketChat/Rocket.Chat)

**Starting Rocket.Chat in microservices mode:**

```bash
yarn turbo run ms
```

After initialized, you can access the server at http://localhost:4000

> ⚠️ Check more detailed information in the [Rocket.Chat Environment Setup](https://developer.rocket.chat/docs/server-environment-setup) guide

# 💻 Installation

Please see the [requirements documentation](https://docs.rocket.chat/deploy/installing-client-apps/minimum-requirements-for-using-rocket.chat) for system requirements and more information about supported operating systems.
Please refer to [Install Rocket.Chat](https://rocket.chat/install) to install your Rocket.Chat instance.

# 📱 Mobile Apps

In addition to the web interface, you can also download Rocket.Chat clients for:


[![Rocket.Chat on Apple App Store](https://user-images.githubusercontent.com/551004/29770691-a2082ff4-8bc6-11e7-89a6-964cd405ea8e.png)](https://itunes.apple.com/us/app/rocket-chat/id1148741252?mt=8) [![Rocket.Chat on Google Play](https://user-images.githubusercontent.com/551004/29770692-a20975c6-8bc6-11e7-8ab0-1cde275496e0.png)](https://play.google.com/store/apps/details?id=chat.rocket.android) [![](https://user-images.githubusercontent.com/551004/48210349-50649480-e35e-11e8-97d9-74a4331faf3a.png)](https://f-droid.org/en/packages/chat.rocket.android)

You can also contribute to the Mobile open source code in [Rocket.Chat.ReactNative](https://github.com/RocketChat/Rocket.Chat.ReactNative) and check it out its [documentation](https://developer.rocket.chat/mobile-app/mobile-app-environment-setup) 

# 🧩 Apps Engine for Rocket.Chat

You can develop your own app that can be integrated with Rocket.Chat. We provide an [Open Source Apps Engine framework](https://developer.rocket.chat/apps-engine/getting-started) increasing the world of possibilities of integrations around the Rocket.Chat ecosystem

# 📚 Learn More

- [Product Documentation](https://docs.rocket.chat)
- [Developer Documentation](https://developer.rocket.chat)
- [API Documentation](https://developer.rocket.chat/reference/api)
- [Apps Engine Development](https://developer.rocket.chat/apps-engine/rocket.chat-apps-and-apps-engine)
- [See who's using Rocket.Chat](https://www.rocket.chat/customers)

# 🆕 Feature Request

[Rocket.Chat/feature-requests](https://github.com/RocketChat/feature-requests) is used to track Rocket.Chat feature requests and discussions. Click [here](https://github.com/RocketChat/feature-requests/issues/new?template=feature_request.md) to open a new feature request. [Feature Request Forums](https://forums.rocket.chat/c/feature-requests/8) stores the historical archives of old feature requests (up to 2018).

# 🤝 Community

Join thousands of members worldwide in our [community server](https://open.rocket.chat).
Join [#support](https://open.rocket.chat/channel/support) and [#general](https://open.rocket.chat/channel/general) for help from the community.


# 👥 Contributions

Rocket.Chat is an open source project and we are very happy to accept community contributions. Please refer to the [How can I help?](https://developer.rocket.chat/contribute-to-rocket.chat/ways-to-contribute) page for more details.


## 💼 Become a Rocketeer

We're hiring developers, support people, and product managers all the time. Please check our [jobs page](https://rocket.chat/jobs).

## 🗞️ Get the Latest News

- [Blog](https://rocket.chat/blog)
- [Twitter](https://twitter.com/RocketChat)
- [Facebook](https://www.facebook.com/RocketChatApp)
- [LinkedIn](https://www.linkedin.com/company/rocket-chat)
- [Youtube](https://www.youtube.com/channel/UCin9nv7mUjoqrRiwrzS5UVQ)

## 🗒️ Credits

- Emoji provided graciously by [JoyPixels](https://www.joypixels.com).

## Установка

<pre>
git remote add upstream https://github.com/RocketChat/Rocket.Chat
git pull upstream develop
</pre>

https://developer.rocket.chat/v1/docs/linux

### Ручная сборка
cd apps/meteor
#meteor build --server-only --directory /var/tmp/rocketchat-build
cp .docker/Dockerfile /var/tmp/rocketchat-build
cp -r xlib /var/tmp/rocketchat-build
cd /var/tmp/rocketchat-build
docker build -t akrasnov87/rocket.chat:develop .

### Запуск

<pre>
sudo rm -r ./rocket-chat
sudo mkdir -p ./rocket-chat
sudo chmod -R 777 ./rocket-chat

# если не выполнить команды выше, то будет ошибка с правами доступа

docker compose -f docker-compose-ee.yml --env-file ./.env up -d
</pre>

### Пример файла с переменными
<pre>
# .env
ADMIN_USERNAME=admin
ADMIN_NAME=Admin
ADMIN_EMAIL=admin@mail.ru
ADMIN_PASS=Gfhjkm-1
#Cloud_Url=http://localhost:9001

# папка для хранения данных от mongodb
MONGO_DATA_PATH=./rocket-chat
MONGODB_VERSION=7.0.15
ROCKET_CHAT_VERSION=7.1.0-develop
</pre>

* MONGO_DATA_PATH - каталог для хранения данных mongodb
* MONGODB_VERSION - версия БД mongodb
* ROCKET_CHAT_VERSION - версия Rocket.Chat

__Примечание__: если сервис `Cloud_Url` подключается отдельно, то указываем этот адрес (для запуска через `docker compose -f docker-compose-ee.yml --env-file ./.env up` его можно не указывать)

## Интеграция с node-oidc-provider

Для подключение внешней авторизации требуется перейти в раздел `Настройки`. Создаём собственный `CustomOAuth`.

В настройках CustomOAuth требуется в `виде логина` указать `Redirect` если выбрано иное значение, то после закрытия `Popup` иногда не прооисходит редирект на страницу.

Чтобы логин отображался по умолчанию, требуется в поле `Поле Имени` указать `sub`

__Примечание__: информацию о полях можно узнать в `apps/meteor/app/cutom-oauth/server/custom_oauth_server.js`

## Тегирование

<pre>
git tag [версия]
git push origin [версия]
</pre>

## Приложение

### Исправлен bug от 27.11.2024

При выполнении команды `yarn build:image` возникает ошибка:

<pre>
error TS2322: Type 'Buffer' is not assignable to type 'Uint8Array'.
</pre>

Чтобы исправить ошибку требуется перейти в каталог `apps/meteor/node_modules/rocketchat-services` и выполнить команду `yarn add -D @types/node@20`

__Примечание__: в Docketfile это исправлено на уровне инструкций. 