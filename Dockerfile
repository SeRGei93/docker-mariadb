FROM vcxpz/baseimage-alpine:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="MariaDB version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment variables
ENV MYSQL_DIR="/config"
ENV DATADIR=$MYSQL_DIR/databases

RUN set -xe && \
	echo "**** install build packages ****" && \
	apk add --no-cache --virtual=build-dependencies \
		curl && \
	if [ -z ${VERSION} ]; then \
		VERSION=$(curl -sL "http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/APKINDEX.tar.gz" | tar -xz -C /tmp && \
			awk '/^P:mariadb$/,/V:/' /tmp/APKINDEX | sed -n 2p | sed 's/^V://'); \
	fi && \
	echo "**** install runtime packages ****" && \
	apk add --no-cache \
		gnupg \
		mariadb-backup=="${VERSION}" \
		mariadb-client=="${VERSION}" \
		mariadb-common=="${VERSION}" \
		mariadb-server-utils=="${VERSION}" \
		mariadb=="${VERSION}" && \
	echo "**** cleanup ****" && \
	apk del --purge \
		build-dependencies && \
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
