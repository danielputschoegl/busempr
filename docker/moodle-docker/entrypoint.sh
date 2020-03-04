#!/bin/bash
set -e

if [ ! -f /var/www/html/moodle/config.php ]; then
sudo -u www-data /usr/bin/php /var/www/html/moodle/admin/cli/install.php --lang=en --dbtype=$DB_TYPE --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbport=$DB_PORT --non-interactive --agree-license --allow-unstable --adminuser=admin --adminpass=password --wwwroot=http://$WWW_ROOT/moodle --dataroot=$DATA_ROOT --fullname=moodle --shortname=moodle
fi

#sudo -u www-data /usr/bin/php /var/www/html/moodle/admin/cli/install.php --lang=en --dbtype=pgsql --dbhost=172.28.0.2 --dbname=moodle --dbuser=moodleuser --dbpass=password --dbport=5432 --non-interactive --agree-license --allow-unstable --adminuser=admin --adminpass=password --wwwroot=http://172.28.0.3/moodle --dataroot=/var/www/moodledata 

#touch /var/www/html/moodle/config.php

#echo "<?php  // Moodle configuration file
#
#unset(\$CFG);
#global \$CFG;
#\$CFG = new stdClass();
#
#\$CFG->dbtype    = '$DB_TYPE';
#\$CFG->dblibrary = 'native';
#\$CFG->dbhost    = '$DB_HOST';
#\$CFG->dbname    = '$DB_NAME';
#\$CFG->dbuser    = '$DB_USER';
#\$CFG->dbpass    = '$DB_PASS';
#\$CFG->prefix    = 'mdl_';
#\$CFG->dboptions = array (
#  'dbpersist' => 0,
#  'dbport' => $DB_PORT,
#  'dbsocket' => '',
#);
#
#\$CFG->wwwroot   = 'http://$WWW_ROOT/moodle';
#\$CFG->dataroot  = '$DATA_ROOT';
#\$CFG->admin     = 'admin';
#
#\$CFG->directorypermissions = 0777;
#
#require_once(__DIR__ . '/lib/setup.php');" > /var/www/html/moodle/config.php
#
#sudo -u www-data /usr/bin/php /var/www/html/moodle/admin/cli/install_database.php --lang=cs --adminpass=$DB_USER --adminpass=$DB_PASS --agree-license

chown -R www-data /var/www

exec "$@"
