## Alpine Edge fork of [linuxserver/docker-mariadb](https://github.com/linuxserver/docker-mariadb/)
[MariaDB](https://mariadb.org/) is one of the most popular database servers. Made by the original developers of MySQL.

[![Docker hub](https://img.shields.io/badge/docker%20hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/vcxpz/mariadb) ![Docker Image Size](https://img.shields.io/docker/image-size/vcxpz/mariadb?style=for-the-badge&logo=docker) [![Autobuild](https://img.shields.io/badge/auto%20build-weekly-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-mariadb/actions?query=workflow%3A%22Cron+Update+CI%22)

## Version Information
![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![s6overlay](https://img.shields.io/badge/s6--overlay-2.1.0.2-blue?style=for-the-badge) ![mariadb](https://img.shields.io/badge/mariadb-10.5.8-003545?style=for-the-badge&logo=mariadb) [![moredetail](https://img.shields.io/badge/more-detail-blue?style=for-the-badge)](https://github.com/hydazz/docker-mariadb/blob/main/package_versions.txt)

## Usage
```
docker run -d \
  --name=mariadb \
  -e PUID=1000 \
  -e PGID=1000 \
  -e MYSQL_ROOT_PASSWORD=ROOT_ACCESS_PASSWORD \
  -e TZ=Australia/Melbourne \
  -e MYSQL_DATABASE=USER_DB_NAME `#optional` \
  -e MYSQL_USER=MYSQL_USER `#optional` \
  -e MYSQL_PASSWORD=DATABASE_PASSWORD `#optional` \
  -e REMOTE_SQL=http://URL1/your.sql,https://URL2/your.sql `#optional` \
  -p 3306:3306 \
  -v <path to appdata>:/config \
  --restart unless-stopped \
  vcxpz/mariadb
```

## Todo
* Stability testing
