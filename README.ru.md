<p align="right">
  <a href="README.md"><img src="https://img.shields.io/badge/English-blue?style=for-the-badge&logo=github" alt="English"></a>
</p>

# DNS Service

Простое решение для управления DNS на базе Docker.

![Лицензия](https://img.shields.io/badge/license-MIT-blue)
![Статус](https://img.shields.io/badge/status-active-brightgreen)

## Оглавление

- [Описание](#описание)
- [Требования](#требования)
- [Установка](#установка)
- [Использование](#использование)
- [Лицензия](#лицензия)

## Описание

DNS Service — это инструмент для быстрой настройки и управления DNS с помощью контейнеров Docker. Подходит для разработки и тестирования.

![Пример интерфейса](screenshot.png)

## Требования

- Docker 20.10+
- docker-compose 1.29+
- Bash

## Установка

Клонируйте репозиторий и установите зависимости:

```bash
git clone https://github.com/your-username/dns-service.git
cd dns-service
```

## Использование

Запустите сервис через docker-compose:

```bash
docker-compose up -d
```

Посмотреть логи:

```bash
docker-compose logs
```

## Лицензия

Проект распространяется под лицензией [MIT](LICENSE).