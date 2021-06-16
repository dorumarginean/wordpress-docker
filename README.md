# WordPress Development with Docker
A simplified yet refined Docker Compose workflow that sets up a LEMP network of containers for local WordPress development based on [Docker Compose WordPress by Andrew Schmelyun](https://github.com/aschmelyun/docker-compose-wordpress)

## Additions to the original repo
- phpMyAdmin container for interacting with the database
- .env file for securing variables

## Usage

#### 1. Edit your hosts file and add:

```php
127.0.0.1 wordpress-docker.local www.wordpress-docker.local
```
#### 2. [Install Docker](https://docs.docker.com/get-docker/) on your system
#### 3. Clone [this repository](https://github.com/dorumarginean/wordpress-docker.git)
```php
# This will create the folder 'wordpress-docker'
git clone https://github.com/dorumarginean/wordpress-docker.git
```
#### 4. Navigate to the directory you cloned this and spin up the containers for the web server:
```php
docker-compose up -d --build site
```

After that completes, follow the steps from the [src/README.md](src/README.md) file to get your WordPress installation added in (or create a new blank one).

Bringing up the Docker Compose network with `site` instead of just using `up`, ensures that only our site's containers are brought up at the start, instead of all of the command containers as well. The following are built for our web server, with their exposed ports detailed:

- **nginx** - `:80`
- **mysql** - `:3306`
- **php** - `:9000`

An additional container is included that lets you use the wp-cli app without having to install it on your local machine. Use the following command examples from your project root, modifying them to fit your particular use case.

- `docker-compose run --rm wp user list`

## Persistent MySQL Storage

By default, whenever you bring down the Docker network, your MySQL data will be removed after the containers are destroyed. If you would like to have persistent data that remains after bringing containers down and back up, do the following:

1. Create a `mysql` folder in the project root, alongside the `nginx` and `php` folders.
2. Under the mysql service in your `docker-compose.yml` file, add the following lines:

```
volumes:
  - ./mysql:/var/lib/mysql
```

## License
[MIT](https://choosealicense.com/licenses/mit/)