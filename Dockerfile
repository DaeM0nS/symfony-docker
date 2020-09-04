FROM php:7.4-cli

EXPOSE 8000

ARG UID=1000

ENV APP_USER=user \
        APP_WORKDIR=/home/user

# Setup container user
RUN set -eux; \
        groupadd -g ${UID} ${APP_USER}; \
        useradd -g ${UID} -d ${APP_WORKDIR} -m ${APP_USER};

# Install extensions for mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install packages
RUN set -eux; \
        apt-get update; \
        apt-get install -y \
                sudo \
                nano \
                git \
                mariadb-client \
        ; \
        rm -rf /var/lib/apt/lists/*

# Setup passwordless sudo
RUN echo "user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony CLI
RUN set -eux; \
        curl -sS https://get.symfony.com/cli/installer | bash; \
        mv /root/.symfony/bin/symfony /usr/local/bin/symfony

USER ${APP_USER}
WORKDIR ${APP_WORKDIR}

# Setup git identity
RUN set -eux; \
        git config --global user.email "${APP_USER}@localhost"; \
        git config --global user.name "${APP_USER}"

# Make mysql connect to db container by default
RUN set -eux; \
        echo "[client]" >> "${APP_WORKDIR}/.my.cnf"; \
        echo "host = db" >> "${APP_WORKDIR}/.my.cnf"; \
        echo "user = root" >> "${APP_WORKDIR}/.my.cnf"

# Sleep forever
CMD ["/bin/bash", "-c", "trap : TERM INT; sleep infinity & wait"]
