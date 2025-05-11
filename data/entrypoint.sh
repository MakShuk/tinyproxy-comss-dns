#!/bin/sh

# Создание файла resolv.conf с указанными DNS-серверами
echo "# Файл создан автоматически из переменной DNS_SERVERS" > /etc/resolv.conf

# Разделение списка DNS-серверов по запятой и добавление их в resolv.conf
IFS=','
for dns in $DNS_SERVERS; do
    echo "nameserver $dns" >> /etc/resolv.conf
done

# Вывод информации о настроенных DNS-серверах
echo "Настроены следующие DNS-серверы:"
cat /etc/resolv.conf

# Запуск tinyproxy
exec tinyproxy -d -c /etc/tinyproxy/tinyproxy.conf