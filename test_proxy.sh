#!/bin/bash

# Загрузка переменных окружения
source .env

# Функция для проверки DNS-серверов
check_dns() {
    local dns_server=$1
    echo "🔍 Проверка DNS-сервера: $dns_server"
    if ping -c 1 $dns_server &> /dev/null; then
        echo "✅ DNS-сервер $dns_server доступен"
        return 0
    else
        echo "❌ DNS-сервер $dns_server недоступен"
        return 1
    fi
}

# Функция для проверки прокси
check_proxy() {
    local proxy="http://${HOST_IP}:8888"
    local timeout=10
    
    echo "=== 🚀 Тестирование прокси-сервера ==="
    echo "📋 Конфигурация:"
    echo "- Адрес прокси: $proxy"
    echo "- Пользователь: $PROXY_USER"
    echo "- DNS-серверы: $DNS_SERVERS"
    
    # Проверка DNS-серверов
    echo -e "\n🔄 Проверка DNS-серверов..."
    IFS=',' read -ra DNS_LIST <<< "$DNS_SERVERS"
    for dns in "${DNS_LIST[@]}"; do
        check_dns $dns
    done
    
    # Проверка доступности прокси
    echo -e "\n📡 Проверка доступности прокси..."
    if curl -x "$proxy" --proxy-user "${PROXY_USER}:${PROXY_PASSWORD}" \
        -m $timeout -s -o /dev/null -w "%{http_code}" https://example.com | grep -q "200"; then
        echo "✅ Прокси успешно отвечает"
        
        # Проверка IP-адреса
        echo -e "\n🔎 Проверка IP-адреса..."
        current_ip=$(curl -x "$proxy" --proxy-user "${PROXY_USER}:${PROXY_PASSWORD}" \
            -s https://api.ipify.org)
        echo "📍 Текущий IP через прокси: $current_ip"
        
        # Проверка скорости отклика
        echo -e "\n⚡ Тестирование скорости..."
        time curl -x "$proxy" --proxy-user "${PROXY_USER}:${PROXY_PASSWORD}" \
            -s -o /dev/null https://example.com
        
        # Проверка работы с указанными DNS
        echo -e "\n🌐 Проверка резолвинга через настроенные DNS..."
        for dns in "${DNS_LIST[@]}"; do
            echo "Тестирование через DNS $dns..."
            host example.com $dns
        done
    else
        echo "❌ Ошибка соединения с прокси"
        return 1
    fi
}

# Запуск проверки
echo "=== 🔍 Начало тестирования прокси и DNS конфигурации ==="
check_proxy
echo "=== 🏁 Тестирование завершено ==="