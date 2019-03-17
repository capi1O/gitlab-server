#!/bin/bash

# /!\ fill required env vars in .env files before running this script

# setup volumes

docker volume create -d local -o type=none -o o=bind -o device=${VOLUME_PATH}gitlab-datastore --name=gitlab-datastore
docker volume create -d local -o type=none -o o=bind -o device=${VOLUME_PATH}gitlab-db --name=gitlab-db
docker volume create -d local -o type=none -o o=bind -o device=${VOLUME_PATH}gitlab-data --name=gitlab-data

# add block to lets encrypt nginx conf

echo ```
# gitlab
server
{
	listen 443 ssl;

	root /config/www;
	index index.html index.htm index.php;

	server_name ${GITHUB_DOMAIN};

	# all ssl related config moved to ssl.conf
	include /config/nginx/ssl.conf;

	client_max_body_size 0;

	location / {
		proxy_pass							http://gitlab;

		proxy_read_timeout      300;
		proxy_connect_timeout   300;
		proxy_redirect          off;

		proxy_set_header        X-Forwarded-Proto $scheme;
		proxy_set_header        Host              $http_host;
		proxy_set_header        X-Real-IP         $remote_addr;
		proxy_set_header        X-Forwarded-For   $proxy_add_x_forwarded_for;
		proxy_set_header        X-Forwarded-Proto https;
		proxy_set_header        X-Frame-Options   SAMEORIGIN;
		# proxy_set_header X-Forwarded-Ssl on; # uncomment if 422 HTTP Error on POST request

		access_log /var/log/nginx/gitlab-access.log;
		error_log /var/log/nginx/gitlab-error.log;
	}
}
``` >> ../lets-encrypt/nginx-config.conf

# run seafile docker and setup database

# fill required env vars in .env

docker-compose up -d
