FROM php:8.2-apache

# Install ekstensi PHP
RUN docker-php-ext-install mysqli

# Salin semua file ke direktori default Apache
COPY . /var/www/html/

# Atur hak akses
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Aktifkan mod_rewrite (jika ada .htaccess)
RUN a2enmod rewrite

EXPOSE 80
