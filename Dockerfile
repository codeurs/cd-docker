FROM node:10

RUN npm i -g @codeurs/php-bin-linux64 ncp
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sL https://sentry.io/get-cli/ | bash
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl
RUN apt-get update \
    && apt-get -y install rsync unzip