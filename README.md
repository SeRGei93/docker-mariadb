## docker-mariadb

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/mariadb) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/mariadb?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-mariadb/actions?query=workflow%3A"Auto+Builder+CI") [![codacy branch grade](https://img.shields.io/codacy/grade/8b8c6b240ae048888a185beb38fcc598/main?style=for-the-badge&logo=codacy)](https://app.codacy.com/gh/hydazz/docker-mariadb)

Fork of [linuxserver/docker-mariadb](https://github.com/linuxserver/docker-mariadb/)

[MariaDB](https://mariadb.org/) was designed as a drop-in replacement of MySQL(R) with more features, new storage engines, fewer bugs, and better performance.

## Initial Setup

Here's a quickstart guide on how to login to MySQL and create a new user and database.

First open a shell to the container.

    docker exec -it <container name> /bin/bash

Then login to MySQL.

    mysql -uroot -p

You will be asked for a password, this is the one set in the `MYSQL_ROOT_PASSWORD` variable.

Create a new user. Change `newuser` and `password` to something else.

    CREATE USER 'newuser'@'%' IDENTIFIED BY 'password';

Create a new database. Change `newdatabase` to something else.

    CREATE DATABASE IF NOT EXISTS newdatabase;

Allow `newuser` to access `newdatabase`.

    GRANT ALL PRIVILEGES on newdatabase.* to 'newuser'@'%';

Then reload the grant tables.

    FLUSH privileges;

All done!
Now you can exit MySQL with

    quit;

Then exit the shell with

    exit

## Usage

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

[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/mariadb.xml)

**Read the official [README.md](https://github.com/linuxserver/docker-mariadb/) for more information**

## Upgrading MariaDB

To upgrade, all you have to do is pull the latest Docker image. We automatically check for MariaDB updates daily so there may be some delay when an update is released to when the image is updated.

## Fixing Appdata Permissions

If you ever accidentally screw up the permissions on the appdata folder, run `fix-perms` within the container. This will restore most of the files/folders with the correct permissions.
