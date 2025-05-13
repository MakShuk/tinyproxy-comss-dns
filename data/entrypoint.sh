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

# Генерация tinyproxy.conf
echo "Port 8888" > /etc/tinyproxy/tinyproxy.conf

# Добавление логина и пароля, если заданы переменные окружения
if [ -n "$PROXY_USER" ] && [ -n "$PROXY_PASSWORD" ]; then
    echo "BasicAuth $PROXY_USER $PROXY_PASSWORD" >> /etc/tinyproxy/tinyproxy.conf
fi

# Запуск tinyproxy
exec tinyproxy -d -c /etc/tinyproxy/tinyproxy.conf