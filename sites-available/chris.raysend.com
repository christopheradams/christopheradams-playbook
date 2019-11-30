server {
    listen 80;
    server_name chris.raysend.com;

    return 301 http://christopheradams.io;
}

