FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="MariaDB version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment variables
ENV MYSQL_DIR="/config"
ENV DATADIR=$MYSQL_DIR/databases

RUN set -x && \
   echo "**** install runtime packages ****" && \
   apk add --no-cache --upgrade \
      gnupg \
      mariadb \
      mariadb-client \
      mariadb-server-utils && \
   echo "**** cleanup ****" && \
   rm -rf \
      /root/.cache \
      /tmp/* && \
   mkdir -p \
      /var/lib/mysql

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 3306
VOLUME /config
