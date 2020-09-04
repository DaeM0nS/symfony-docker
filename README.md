# Symfony development environment with Docker

This project aims to simplify setting up a development-ready
environment for Symfony.

This project is pretty much made to ease my university colleagues in
getting their stuff working while introducing them to Docker
indirectly.

## Requirements

* Machine running Linux
* Docker
* docker-compose

## Setup

### Install Docker

Follow the official tutorials listed below, choose one that matches
your current Linux distribution:

* Debian: https://docs.docker.com/engine/install/debian/
* CentOS: https://docs.docker.com/engine/install/centos/
* Fedora: https://docs.docker.com/engine/install/fedora/
* Ubuntu: https://docs.docker.com/engine/install/ubuntu/

### Install docker-compose

Follow the linked tutorial to install docker-compose:
https://docs.docker.com/compose/install/

### Download the repository

#### Method 1: Git

Simply clone the repository with the following command:

```shell
$ git clone https://github.com/yukiisbored/symfony-docker
```

#### Method 2: Archive download

While on the GitHub repository web page, click on the green "Code"
button on next to the file browser. From there, click on the Download
Zip button and extract it.

## Usage (Host-side)

### Start the containers

To start the containers, simply do the following:

```shell
$ docker-compose up -d
```

> **Note**
>
> The `-d` flag means docker-compose will daemonize when the
> containers are launched.

### Launch a shell

To launch a shell inside the container, simply do the following:

```shell
$ docker-compose exec app bash
```

## Important notes

* Your projects should be placed inside the `work` folder. The `work`
  folder is shared between the container and the host.
* Storing your projects in the `work` folder is important. If not,
  your projects will be lost.
* The container setup also includes MySQL/MariaDB. It is only
  accessible within the container. The hostname of it is `db`, not
  `localhost`.
* The MySQL database have a password-less root account. In the
  container, `mysql` is preconfigured to automatically connect as root
  to the database.
