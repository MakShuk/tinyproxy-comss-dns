<p align="right">
  <a href="README.ru.md"><img src="https://img.shields.io/badge/Русский-red?style=for-the-badge&logo=github" alt="Русский"></a>
</p>

# DNS Service

A simple Docker-based service for DNS configuration and management.

![License](https://img.shields.io/badge/license-MIT-blue)
![Status](https://img.shields.io/badge/status-active-brightgreen)

## Table of Contents

- [Description](#description)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Description

DNS Service provides an easy way to manage DNS settings using Docker containers. It is designed for quick deployment and configuration in development or testing environments.

![Example Interface](screenshot.png)

## Requirements

- Docker 20.10+
- docker-compose 1.29+
- Bash

## Installation

Clone the repository and install dependencies:

```bash
git clone https://github.com/your-username/dns-service.git
cd dns-service
```

## Usage

Start the service using docker-compose:

```bash
docker-compose up -d
```

Check logs:

```bash
docker-compose logs
```

## License

This project is licensed under the [MIT](LICENSE) license.