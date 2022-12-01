FROM php:7.4-alpine

RUN apk add git &>/dev/null

RUN git clone https://github.com/darey-devops/php-todo.git $HOME/php-todo &>/dev/null

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions pdo_mysql &>/dev/null && install-php-extensions @composer &>/dev/null

ENV DB_HOST=db

WORKDIR /root/php-todo

RUN sed -i -e "s/DB_HOST=127\.0\.0\.1/DB_HOST=${DB_HOST}/" .env.sample && mv .env.sample .env 
# RUN mv .env.sample .env
RUN composer install --ignore-platform-reqs &>/dev/null
RUN php artisan config:clear
RUN php artisan migrate
RUN php artisan key:generate
RUN php artisan db:seed
RUN php artisan serve --host:0.0.0.0

# COPY ./serve.sh serve.sh

# ENTRYPOINT ["sh", "serve.sh"]