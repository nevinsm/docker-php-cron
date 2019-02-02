FROM nevinsm/php-fpm:7.3
LABEL maintainer="Nevin Morgan <nevins.morgan@gmail.com>"

# Install cron
RUN LC_ALL=C.UTF-8 apt-get update && apt-get install -y \
    cron && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

#   Add your cron file
ADD cron /etc/cron.d/cronfile
RUN chmod 0644 /etc/cron.d/cronfile

#   This will add it to the cron table (crontab -e)
RUN crontab /etc/cron.d/cronfile

ENTRYPOINT [ "/usr/sbin/cron", "-f" ]
