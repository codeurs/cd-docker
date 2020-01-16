FROM node:12

ENV YARN_VERSION 1.21.1

RUN npm i -g @codeurs/php-bin-linux64 ncp
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sL https://sentry.io/get-cli/ | bash
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl
RUN apt-get update \
    && apt-get -y install git rsync unzip openconnect ocproxy
RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz
