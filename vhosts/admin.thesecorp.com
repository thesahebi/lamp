location / {
    root /var/www/html/admin.thesecorp.com;
    index index.html index.htm;
}
