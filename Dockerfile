ARG PHP_VERSION=8.4
ARG ICE_VERSION=1.11.0
FROM php:${PHP_VERSION}-fpm-alpine

ARG ICE_VERSION
ENV ICE_VERSION=${ICE_VERSION}
RUN apk update \
    && apk add --no-cache \
        ${PHPIZE_DEPS} \
    && docker-php-source extract \
    && MAKEFLAGS="-j $(nproc)" CFLAGS="${PHP_CFLAGS} -DALPINE_LINUX" pecl install \
        ice-${ICE_VERSION} \
    && docker-php-ext-enable --ini-name 90-docker-php-ext-ice.ini ice \
    && docker-php-source delete \
    && apk del ${PHPIZE_DEPS}