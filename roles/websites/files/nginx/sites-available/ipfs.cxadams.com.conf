server {
    listen 80;
    server_name ipfs.cxadams.com;

    root /srv/www/html;
    index index.html index.htm;

    location / {
        proxy_pass http://0.0.0.0:8080;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        allow all;
    }
}
