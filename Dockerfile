FROM node:13-alpine

RUN apk add --update --no-cache git curl php php-json php-json php-iconv php-openssl php-phar php-curl php-mbstring \
 php-ctype php-xml

# Install Composer
RUN curl -L https://github.com/despark/keepachangelog/releases/download/v1.1.0/keepachangelog.phar \
 -o /usr/local/bin/keepachangelog && chmod +x /usr/local/bin/keepachangelog

RUN npm -g install semantic-release@17 @semantic-release/gitlab @semantic-release/exec @semantic-release/git

CMD ["semantic-release"]