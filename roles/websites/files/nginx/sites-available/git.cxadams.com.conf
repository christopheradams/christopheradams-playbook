server {
    listen 80;
    server_name git.cxadams.com;

    root /srv/www/html;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
}

