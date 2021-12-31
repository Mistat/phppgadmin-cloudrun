FROM php:7.4.27-apache
ENV PORT 80

RUN apt-get update && apt-get install -y wget supervisor libpq-dev
RUN docker-php-ext-install pgsql

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install cloudsql proxy
# https://cloud.google.com/sql/docs/postgres/connect-external-app?hl=ja
RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
RUN chmod +x cloud_sql_proxy && cp cloud_sql_proxy /usr/bin/


COPY phppgadmin/ /var/www/html/
COPY config.inc.php /var/www/html/conf/

ENTRYPOINT []
CMD sed -i "s/80/$PORT/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf && /usr/bin/supervisord
