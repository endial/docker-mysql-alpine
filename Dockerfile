FROM endial/base-alpine

MAINTAINER Endial Fang ( endial@126.com )

RUN  apk update \
  && apk add mysql mysql-client pwgen \
  && rm -rf /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 3306

VOLUME ["/srv/data", "/srv/conf", "/var/log", "/var/run"]

ENTRYPOINT ["/entrypoint.sh"]
