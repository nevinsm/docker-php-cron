FROM nevinsm/php-fpm:7.3
LABEL maintainer="Nevin Morgan <nevins.morgan@gmail.com>"

# Install cron
RUN LC_ALL=C.UTF-8 apt-get update && apt-get install -y \
    cron && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/sbin/cron", "-f", "-L", "7" ]
