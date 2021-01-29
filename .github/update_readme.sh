#!/bin/bash

sed -i -E \
	-e "s/mariadb-.*?-003545/mariadb-${APP_VERSION}-003545/g" \
	README.md
