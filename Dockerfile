FROM thecodingmachine/php:7.3-v2-cli

ENV APP_ENV=dev \
    COMPOSER_MEMORY_LIMIT=-1 \
    PHP_EXTENSION_CURL=1 \
    PHP_EXTENSION_PCNTL=1 \
    PHP_EXTENSION_SQLITE3=1 \
    PHP_EXTENSION_XML=1 \
    PHP_EXTENSION_ZIP=1 \
    PHP_INI_REALPATH_CACHE_SIZE=4096k \
    PHP_INI_REALPATH_CACHE_TTL=7200 \
    TEMPLATE_PHP_INI=production

RUN git clone --recursive --depth 1 --branch master https://github.com/jfoucher/Mailocal.git .
RUN composer install && \
    composer clearcache

COPY entrypoint.sh /etc/container/startup.sh

EXPOSE 2525 8000