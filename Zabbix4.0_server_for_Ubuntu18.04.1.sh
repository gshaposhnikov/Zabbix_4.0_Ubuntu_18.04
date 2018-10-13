#!/bin/bash


## https://github.com/gshaposhnikov

### Copyright (c) 2018 Gennady Shaposhnikov. Released under the MIT License.

### This script will perform a full installation of Zabbix-server 4.0 and write configuration files! 

## Before running the script in a real system, make your adjustments (if necessary) and check the work in the test environment!

### The script was tested on Linux distribution Ubuntu 18.04.01 server.
### If you think it is necessary, make the appropriate corrections to the script before running it!
### Your system will be updated to the current state in the process of the script.
### run the sudo script ./name_script.sh
### The script must be executable.

## Possible options for loading the script to the server:

### Load the script from the client to the server (execute commands on the client:)

### ru 1) scp /home/user/Рабочий\ стол/Zabbix4.0_server_for_Ubuntu18.04.1.sh user@ip_server_address:/home/user (Left side before the user, the location of the script on the client. Right side, instead of user, specify your account on the server and its ip.)
### en 2) scp /home/user/Desktop/Zabbix4.0_server_for_Ubuntu18.04.1.sh user@ip_server_address:/home/user
###    3) go to the script download directory, in the example cd /home/user 
###    4) run the sudo script ./name_script.sh

## or

# Download the script from the client machine to the server (execute commands on the server:) 

###    1) scp user@ip_address_of_the_computer_from_which_we_download:/home/user/name_script.sh /home/user (/home/user directory where the file will be copied)
###    2) go to the script download directory, in the example cd /home/user 
###    3) run the sudo script ./name_script.sh


### Данный скрипт, выполнит полную установку Zabbix-сервера 4.0 и запишет конфигурационные файлы!  

## Перед запуском скрипта в реальной системе, внесите свой корректировки, (если они нужны) и проверьте работу в тестовой среде!

### Скрипт протестирован на дистрибутиве Linux Ubuntu 18.04.01 server.
### Если вы считаете необходимым, внесите соответствующие исправления в скрипт перед его запуском!
### Ваша система будет обновлена до актуального состояния, в процессе работы скрипта.
###                               запускаем скрипт sudo ./name_script.sh
### Скрипт должен быть исполняемым.

## Возможные варианты загрузки скрипта, на сервер:

### Загрузка скрипта, от клиента на сервер (выполняем команды на клиенте:)

###    ru  1) scp /home/user/Рабочий\ стол/Zabbix4.0_server_for_Ubuntu18.04.1.sh user@ip_адрес_сервера:/home/user   (Левая сторона до user, расположение скрипта на клиенте. Правая сторона, вместо user укажите вашу учётную запись на сервере и его ip.)
###	   en  2) scp /home/user/Desktop/Zabbix4.0_server_for_Ubuntu18.04.1.sh user@ip_server_address:/home/user
### 	   2) переходим в каталог загрузки script, в примере сd /home/user 
###        3) запускаем скрипт sudo ./name_script.sh

## или

# Скачивание скрипта с клиентской машины на сервер (выполняем команды на сервере:) 

###        1) scp user@ip_адрес_компьютера_с_которого_скачиваем:/home/user/name_script.sh /home/user   (/home/user директория куда файл будет скопирован)
### 	   2) переходим в каталог загрузки scripta, в примере сd /home/user 
###        3) запускаем скрипт sudo ./name_script.sh

# Подключаю репозитории zabbix 4.0

echo $(tput setaf 2) "Подключаю репозитории zabbix 4.0" $(tput sgr 0)

wget https://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-2+bionic_all.deb

dpkg -i zabbix-release_4.0-2+bionic_all.deb

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0) 

# Обновляю все пакеты.

echo $(tput setaf 2) "Обновляю все пакеты" $(tput sgr 0)

apt-get -y update 
apt-get -y upgrade 

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Устанавливаю сервер Zabbix 4.0

echo $(tput setaf 2) "Устанавливаю сервер Zabbix 4.0" $(tput sgr 0)

apt install -y zabbix-server-mysql zabbix-frontend-php 

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Останавливаю и отключаю apache.

echo $(tput setaf 2) "Останавливаю и отключаю apache" $(tput sgr 0)

systemctl stop apache2
systemctl disable apache2

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Устанавливаю сервер nginx и php-fpm.

echo $(tput setaf 2) "Устанавливаю сервер nginx и php-fpm" $(tput sgr 0)

apt install -y nginx php-fpm

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Запускаю скрипт начальной конфигурации mysql и задаем пароль для root. Все остальное можно оставить по-умолчанию.

echo $(tput setaf 2) "Запускаю скрипт начальной конфигурации mysql и задаем пароль для root. Все остальное можно оставить по-умолчанию." $(tput sgr 0)

echo $(tput setaf 2) "Задаем пароль для root. Все остальное можно оставить по-умолчанию." $(tput sgr 0)

/usr/bin/mysql_secure_installation

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Записываю параметры Mariadb в конфиг /etc/mysql/mariadb.conf.d/50-server.cnf:

echo $(tput setaf 2) "Записываю параметры Mariadb в конфиг /etc/mysql/mariadb.conf.d/50-server.cnf:" $(tput sgr 0)

{
echo '#'
echo '# These groups are read by MariaDB server.'
echo '# Use it for options that only the server (but not clients) should see'
echo '#'
echo '# See the examples of server my.cnf files in /usr/share/mysql/'
echo '#'
echo ''
echo '# this is read by the standalone daemon and embedded servers'
echo '[server]'
echo ''
echo '# this is only for the mysqld standalone daemon'
echo '[mysqld]'
echo ''
echo '#'
echo '# * Basic Settings'
echo '#'
echo 'innodb_file_per_table=1'
echo 'innodb_buffer_pool_size = 768M # внимание на параметр! установить примерно в 2 раза меньше объема оперативной памяти сервера'
echo 'innodb_buffer_pool_instances=1 # увеличивать на 1 каждый GB innodb_buffer_pool_size'
echo 'innodb_flush_log_at_trx_commit = 0'
echo 'innodb_log_file_size = 512M'
echo 'innodb_log_files_in_group = 3'
echo 'user		= mysql'
echo 'pid-file	= /var/run/mysqld/mysqld.pid'
echo 'socket		= /var/run/mysqld/mysqld.sock'
echo 'port		= 3306'
echo 'basedir		= /usr'
echo 'datadir		= /var/lib/mysql'
echo 'tmpdir		= /tmp'
echo 'lc-messages-dir	= /usr/share/mysql'
echo 'skip-external-locking'
echo ''
echo '# Instead of skip-networking the default is now to listen only on'
echo '# localhost which is more compatible and is not less secure.'
echo 'bind-address		= 127.0.0.1'
echo ''
echo '#'
echo '# * Fine Tuning'
echo '#'
echo 'key_buffer_size		= 16M'
echo 'max_allowed_packet	= 16M'
echo 'thread_stack		= 192K'
echo 'thread_cache_size       = 8'
echo '# This replaces the startup script and checks MyISAM tables if needed'
echo '# the first time they are touched'
echo 'myisam_recover_options  = BACKUP'
echo '#max_connections        = 100'
echo '#table_cache            = 64'
echo '#thread_concurrency     = 10'
echo ''
echo '#'
echo '# * Query Cache Configuration'
echo '#'
echo 'query_cache_limit	= 1M'
echo 'query_cache_size        = 16M'
echo ''
echo '#'
echo '# * Logging and Replication'
echo '#'
echo '# Both location gets rotated by the cronjob.'
echo '# Be aware that this log type is a performance killer.'
echo '# As of 5.1 you can enable the log at runtime!'
echo '#general_log_file        = /var/log/mysql/mysql.log'
echo '#general_log             = 1'
echo '#'
echo '# Error log - should be very few entries.'
echo '#'
echo 'log_error = /var/log/mysql/error.log'
echo '#'
echo '# Enable the slow query log to see queries with especially long duration'
echo '#slow_query_log_file	= /var/log/mysql/mariadb-slow.log'
echo '#long_query_time = 10'
echo '#log_slow_rate_limit	= 1000'
echo '#log_slow_verbosity	= query_plan'
echo '#log-queries-not-using-indexes'
echo '#'
echo '# The following can be used as easy to replay backup logs or for replication.'
echo '# note: if you are setting up a replication slave, see README.Debian about'
echo '#       other settings you may need to change.'
echo '#server-id		= 1'
echo '#log_bin			= /var/log/mysql/mysql-bin.log'
echo 'expire_logs_days	= 10'
echo 'max_binlog_size   = 100M'
echo '#binlog_do_db		= include_database_name'
echo '#binlog_ignore_db	= exclude_database_name'
echo ''
echo '#'
echo '# * InnoDB'
echo '#'
echo '# InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.'
echo '# Read the manual for more InnoDB related options. There are many!'
echo ''
echo '#'
echo '# * Security Features'
echo '#'
echo '# Read the manual, too, if you want chroot!'
echo '# chroot = /var/lib/mysql/'
echo '#'
echo '# For generating SSL certificates you can use for example the GUI tool "tinyca".'
echo '#'
echo '# ssl-ca=/etc/mysql/cacert.pem'
echo '# ssl-cert=/etc/mysql/server-cert.pem'
echo '# ssl-key=/etc/mysql/server-key.pem'
echo '#'
echo '# Accept only connections using the latest and most secure TLS protocol version.'
echo '# ..when MariaDB is compiled with OpenSSL:'
echo '# ssl-cipher=TLSv1.2'
echo '# ..when MariaDB is compiled with YaSSL (default in Debian):'
echo '# ssl=on'
echo ''
echo '#'
echo '# * Character sets'
echo '#'
echo '# MySQL/MariaDB default is Latin1, but in Debian we rather default to the full'
echo '# utf8 4-byte character set. See also client.cnf'
echo '#'
echo 'character-set-server  = utf8mb4'
echo 'collation-server      = utf8mb4_general_ci'
echo ''
echo '#'
echo '# * Unix socket authentication plugin is built-in since 10.0.22-6'
echo '#'
echo '# Needed so the root database user can authenticate without a password but'
echo '# only when running as the unix root user.'
echo '#'
echo '# Also available for other users if required.'
echo '# See https://mariadb.com/kb/en/unix_socket-authentication-plugin/'
echo ''
echo '# this is only for embedded server'
echo '[embedded]'
echo ''
echo '# This group is only read by MariaDB servers, not by MySQL.'
echo '# If you use the same .cnf file for MySQL and MariaDB,'
echo '# you can put MariaDB-only options here'
echo '[mariadb]'
echo ''
echo '# This group is only read by MariaDB-10.1 servers.'
echo '# If you use the same .cnf file for MariaDB of different versions,'
echo '# use this group for options that older servers dont understand'
echo '[mariadb-10.1]'


} > /etc/mysql/mariadb.conf.d/50-server.cnf


echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Перезапускаю mariadb.

echo $(tput setaf 2) "Перезапускаю mariadb." $(tput sgr 0)

systemctl restart mariadb

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Cоздаю базу данных, пользователя zabbix, и заполняю базу. Скопируйте подсказки, и вставьте их в терминал! 

echo $(tput setaf 2) "Cоздаю базу данных, пользователя zabbix, и заполняю базу" $(tput sgr 0)

echo $(tput setaf 2) "В MariaDB> Введите следующие команды:" $(tput sgr 0)

echo $(tput setaf 2) "create database zabbix character set utf8 collate utf8_bin;" $(tput sgr 0)

echo $(tput setaf 2) "grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';" $(tput sgr 0)

echo $(tput setaf 2) "exit;" $(tput sgr 0)

mysql -uroot -p

echo $(tput setaf 2) "Введите пароль: zabbix" $(tput sgr 0)

zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uzabbix -p zabbix

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0) 


# Записываю параметры Mariadb в конфиг /etc/zabbix/zabbix_server.conf:

echo $(tput setaf 2) "Записываю параметры Mariadb в конфиг /etc/zabbix/zabbix_server.conf:" $(tput sgr 0)

{
echo 'DBPassword=zabbix'
echo 'ListenIP=0.0.0.0'
echo 'Timeout=10'

} >> /etc/zabbix/zabbix_server.conf


echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Запускаю zabbix и добавляю его в автозагрузку.

echo $(tput setaf 2) "Запускаю zabbix и добавляю его в автозагрузку." $(tput sgr 0)

systemctl start zabbix-server
systemctl enable zabbix-server

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)

# Проверяю статус Zabbix 4.0

echo $(tput setaf 2) "Проверяю статус Zabbix 4.0" $(tput sgr 0)

netstat -tulnp | grep zabbix_server

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Запускаю web сервер nginx.

echo $(tput setaf 2) "Запускаю web сервер nginx." $(tput sgr 0)

systemctl start nginx
systemctl enable nginx

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Проверяю, что в качестве web сервера работает nginx.

echo $(tput setaf 2) "Проверяю, что в качестве web сервера работает nginx." $(tput sgr 0)

netstat -tulnp | grep 80

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


echo $(tput setaf 2) "Записываю параметры в конфиг nginx для работы web интерфейса zabbix" $(tput sgr 0)

{
echo 'server {'
echo '    listen       80;'
echo '    server_name  localhost;'
echo '    root /usr/share/zabbix;'
echo ''
echo '    location / {'
echo '    index index.php index.html index.htm;'
echo '    }'
echo ''
echo '    location ~ \.php$ {'
echo '    fastcgi_pass unix:/run/php/php7.2-fpm.sock;'
echo '    fastcgi_index index.php;'
echo '    fastcgi_param SCRIPT_FILENAME  $document_root$fastcgi_script_name;'
echo '    include fastcgi_params;'
echo '    fastcgi_param PHP_VALUE "'
echo '    max_execution_time = 300'
echo '    memory_limit = 128M'
echo '    post_max_size = 16M'
echo '    upload_max_filesize = 2M'
echo '    max_input_time = 300'
echo '    date.timezone = Europe/Samara'  # Измените на свой регион!
echo '    always_populate_raw_post_data = -1'
echo '    ";'
echo '    fastcgi_buffers 8 256k;'
echo '    fastcgi_buffer_size 128k;'
echo '    fastcgi_intercept_errors on;'
echo '    fastcgi_busy_buffers_size 256k;'
echo '    fastcgi_temp_file_write_size 256k;'
echo '        }'
echo '}'


} > /etc/nginx/sites-available/default


# Проверяю конфиг на ошибки и перезапускаю nginx.

echo $(tput setaf 2) "Проверяю конфиг на ошибки и перезапускаю nginx." $(tput sgr 0)

nginx -t
nginx -s reload

echo $(tput setaf 3) "Выполнено!" $(tput sgr 0)


# Комментарий.

echo $(tput setaf 1) "Вы можете зайти на сам сервер, набрав в адресной строке браузера http://ip-сервера/" $(tput sgr 0)

echo $(tput setaf 1) "Логин: Admin (обязательно с большой буквы)" $(tput sgr 0)

echo $(tput setaf 1) "Пароль: zabbix" $(tput sgr 0)














