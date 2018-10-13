## Zabbix4.0_server_for_Ubuntu18.04.1

En

The script is based on articles: https://serveradmin.ru/ustanovka-i-nastroyka-zabbix-4-0/

The script is tested on Linux distribution Ubuntu 18.04.1 LTS.

Before running the script, test it in a test environment! 

## Description
This script will perform the installation and configuration of Zabbix server 4.0 and all of its dependencies. 
Will write down all necessary configuration files. During the installation process, copy the commands to create the database. The password to import the database: zabbix. 
These commands will be available in the terminal when the script is executed. 

 Script must be executable! 

 Possible options for loading the script to the server:

## This script will perform a full installation of Zabbix-server 4.0 and write configuration files! 

## Before running the script in a real system, make your adjustments (if necessary) and check the work in the test environment!

## The script was tested on Linux distribution Ubuntu 18.04.01 server.
 If you think it is necessary, make the appropriate corrections to the script before running it!
 Your system will be updated to the current state in the process of the script.
 run the sudo script ./name_script.sh
 The script must be executable.

## Possible options for loading the script to the server:

## Load the script from the client to the server (execute commands on the client:)

 1) scp /home/user/Рабочий\ стол/Zabbix4.0_server_for_Ubuntu18.04.1.sh user@ip_server_address:/home/user (Left side before the user, the location of the script on the client. Right side, instead of user, specify your account on the server and its ip.)
 or
 2) scp /home/user/Desktop/Zabbix4.0_server_for_Ubuntu18.04.1.sh user@ip_server_address:/home/user (en Desktop)
 3) go to the script download directory, in the example cd /home/user 
 4) run the sudo script ./name_script.sh

## or

## Download the script from the client machine to the server (execute commands on the server:) 

 1) scp user@ip_address_of_the_computer_from_which_we_download:/home/user/name_script.sh /home/user (/home/user directory where the file will be copied)
 2) go to the script download directory, in the example cd /home/user 
 3) run the sudo script ./name_script.sh


## Installation
To run the executable script in the terminal, run the following command: 

sudo ./Zabbix4.0_server_for_Ubuntu18.04.1.sh

## The MIT license

Ru

Скрипт создан на базе статьи: https://serveradmin.ru/ustanovka-i-nastroyka-zabbix-4-0/

Скрипт протестирован на дистрибутиве Linux Ubuntu 18.04.1 LTS.

Перед запуском скрипта, протестируйте его работу в тестовой среде!

## Описание
Этот скрипт выполнит установку и настройку сервера Zabbix 4.0 и всех его зависимостей. Запишет все необходимые конфигурационные файлы. 
В процессе установки, скопируйте команды для создания базы данных. Пароль для импорта базы данных: zabbix. Эти команды будут доступны в терминале при выполнении скрипта. 

 Скрипт должен быть исполняемым! 

 Возможные варианты загрузки скрипта, на сервер:

## Данный скрипт, выполнит полную установку Zabbix-сервера 4.0 и запишет конфигурационные файлы!  

## Перед запуском скрипта в реальной системе, внесите свой корректировки, (если они нужны) и проверьте работу в тестовой среде!

## Скрипт протестирован на дистрибутиве Linux Ubuntu 18.04.01 server.
 Если вы считаете необходимым, внесите соответствующие исправления в скрипт перед его запуском!
 Ваша система будет обновлена до актуального состояния, в процессе работы скрипта.
                               запускаем скрипт sudo ./name_script.sh
 Скрипт должен быть исполняемым.

## Возможные варианты загрузки скрипта, на сервер:

## Загрузка скрипта, от клиента на сервер (выполняем команды на клиенте:)

 1) scp /home/user/Рабочий\ стол/Zabbix4.0_server_for_Ubuntu18.04.1.sh user@_server_address:/home/user   (Левая сторона до user, расположение скрипта на клиенте. Правая сторона, вместо user укажите вашу учётную запись на сервере и его ip.)
 или
 2) scp /home/user/Desktop/Zabbix4.0_server_for_Ubuntu18.04.1.sh user@ip_server_address:/home/user
 3) переходим в каталог загрузки script, в примере сd /home/user 
 4) запускаем скрипт sudo ./name_script.sh

## или

## Скачивание скрипта с клиентской машины на сервер (выполняем команды на сервере:) 

 1) scp user@ip_адрес_компьютера_с_которого_скачиваем:/home/user/name_script.sh /home/user   (/home/user директория куда файл будет скопирован)
 2) переходим в каталог загрузки scripta, в примере сd /home/user 
 3) запускаем скрипт sudo ./name_script.sh

## Установка
Для запуска исполняемого скрипта в терминале, выполните команду:
sudo ./Zabbix4.0_server_for_Ubuntu18.04.1.sh

## Лицензия MIT.
