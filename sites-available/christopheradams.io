server {
    listen 80;
    server_name christopheradams.io www.christopheradams.io;

    return 301 https://christopheradams.io$request_uri;
}

server {
	listen 443;
	server_name christopheradams.io;

	root /srv/www/christopheradams.io/public;
	index index.html index.htm;

	location ~ /\.ht {
            deny all;
	}

	location ~ /\.git {
            deny all;
	}

        location /feed.xml {
            types { }
            default_type application/atom+xml;
        }

	location / {
 	    try_files $uri $uri/ =404;
	}

	error_page 404 /404.html;
}
