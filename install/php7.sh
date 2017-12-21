#!/bin/bash

sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y

sudo apt-get install -y \
    php7.1-cgi    \
    php7.1-cli    \
    php7.1-fpm    \
    php7.1-bcmath    \
    php7.1-bz2    \
    php7.1-common    \
    php7.1-curl    \
    php7.1-dba    \
    php7.1-gd    \
    php7.1-imap    \
    php7.1-intl    \
    php7.1-json    \
    php7.1-ldap    \
    php7.1-mbstring    \
    php7.1-mcrypt    \
    php7.1-mysql    \
    php7.1-odbc    \
    php7.1-pgsql    \
    php7.1-readline    \
    php7.1-soap    \
    php7.1-sqlite3    \
    php7.1-sybase    \
    php7.1-xml    \
    php7.1-xmlrpc    \
    php7.1-zip    \
    php7.1-opcache    \
    php7.1-xsl    \
    php-xdebug 

    # php7.1-phpdbg    \
    # php7.1-enchant    \
    # php7.1-tidy    \
    # php7.1-pspell    \
    # php7.1-snmp    \
    # php7.1-recode    \
    # php7.1-interbase    \
    # php7.1-gmp    \
    # php7.1-dev    \
