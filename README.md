## Alpine Edge fork of [linuxserver/docker-mariadb](https://github.com/linuxserver/docker-mariadb/)
[MariaDB](https://mariadb.org/) was designed as a drop-in replacement of MySQL(R) with more features, new storage engines, fewer bugs, and better performance.

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/vcxpz/mariadb) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/mariadb?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/auto_build-weekly-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-mariadb/actions?query=workflow%3A%22Cron+Update+CI%22)

## Version Information
![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![s6 overlay](https://img.shields.io/badge/s6_overlay-2.1.0.2-blue?style=for-the-badge) ![mariadb](https://img.shields.io/badge/mariadb-10.5.8-003545?style=for-the-badge&logo=mariadb)

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
  -p 3306:3306 \
  -v <path to appdata>:/config \
  --restart unless-stopped \
  vcxpz/mariadb
```
On Unraid? There's a [template](https://github.com/hydazz/docker-templates/blob/main/hydaz/mariadb.xml)

## Todo
* Nothing, everything works 🙂
