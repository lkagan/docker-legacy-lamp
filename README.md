# Docker Usage

## Prerequisites

* Ensure Docker and Docker Compose are installed
  * [Docker Desktop](https://www.docker.com/products/docker-desktop) is the
    quickest and easiest way to get started with Docker.
  * Docker Compose is included in *Docker Desktop*
* Ensure no applications are currently using ports 80 or 3306 on your system.
    As alternatives, you can change ports:
  * Update `docker-compose.yml` 
  * Copy `docker-compose.yml` to `docker-compose.override.yml` and make any
    changes there without affecting the repo.

## Integration with existing project

* Place a `mysqldump` of the project's database (including the `create`
    statement) in the `db_data` directory. All files in this directory will be
    imported on first run in alphabetical order.
* Place all website code into the `code` directory.
  * Directory name can be changed.  Update `docker-compose.yml` as needed.
* Ensure the website has a `public` directory as document root.
  * This can be changed in `apache.conf`. See *Configuration changes* below.

## Starting & stopping services

* From the command line in the project run `docker-compose up -d`.  This may
    take a while the first time it's run.
* Stop all services with `docker-compose stop`

## Accessing services

* The site will be accessible at http://localhost
* Client applications like the `mysql` command line client or GUI clients can
 access the DB at:
  * Host: 127.0.0.1
  * User: root
  * Password: \<empty\>

## Configuration changes

* Any changes to these configuration files requires removal of the custom
Apache / PHP image and recration. This is done with:
  1. `docker-compose down`
  1. `docker rmi apache-php7`
  1. `docker-compose up -d`
* Apache configuration changes can be done in `apache.conf` in the root directory.
* PHP configuration changes can be done in `php.ini` in the root directory.

## Helpful commands

* System logs can be accessed with `docker-compose logs -f` from the project 
    directory.
* Destroy containers with `docker-compose down`.  This is helpful when changing
    configuration or tweaking the DB import.
  * `docker-compose down` and `docker-compose up -d` to start over.
