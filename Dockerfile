FROM node:13-alpine

RUN apk add --update --no-cache git curl php php-json php-json php-iconv php-openssl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer --version
RUN composer global require hirak/prestissimo
RUN composer global require despark/keepachangelog-release

RUN npm -g install semantic-release@17 @semantic-release/gitlab

CMD ["semantic-release"]