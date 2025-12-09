#!/usr/bin/env bash

echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/setup-password password root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/configure-webserver select apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/internal/skip-preseed boolean true" | debconf-set-selections
