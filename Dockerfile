FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG MARIADB_RELEASE
LABEL build_version="MariaDB version:- ${MARIADB_RELEASE} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment variables
ENV MYSQL_DIR="/config"
ENV DATADIR=$MYSQL_DIR/databases

RUN set -xe && \
   echo "**** install runtime packages ****" && \
   apk add --no-cache --upgrade \
      gnupg \
      mariadb \
      mariadb-client \
      mariadb-common && \
   echo "**** cleanup ****" && \
   rm -rf \
      /root/.cache \
      /tmp/* && \
   mkdir -p \
      /var/lib/mysql

# copy local files
COPY root/ /

# mariadb healthcheck
HEALTHCHECK --start-period=10s --timeout=5s \
   CMD pgrep mysqld

# ports and volumes
EXPOSE 3306
VOLUME /config
