server {
    listen 80;
    server_name ~(www\.)?christopheradams\.(io|us)$ ~(www\.)?cxadams\.com$;

    root /srv/www/christopheradams.io;
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

    if ($host != 'christopheradams.io') {
        return 301 http://christopheradams.io$request_uri;
    }
}
