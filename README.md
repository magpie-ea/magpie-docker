# magpie-docker

Current version: magpie-backend v2.3.2

This repository contains the code for the docker image that runs [magpie-backend](https://github.com/magpie-ea/magpie-backend)

It is still experimental.

A sample docker-compose.yml file could look like this:

```yml
version: '3'
services:
  web:
    image: ghcr.io/magpie-ea/magpie-docker:master
    # Map the 4000 of localhost to the 4000 of the container
    ports:
      - "4000:4000"
    environment:
      PORT: 4000
      DATABASE_URL: 'postgresql://magpie:magpie@db:5432/magpie?ssl=false' # user:password@host:port/database and ssl=false because we're in docker
      SECRET_KEY_BASE: "secretsecretsecretsecretsecretsecretsecretsecretsecretsecretsecret" # at least 64 chars
      MAGPIE_NO_BASIC_AUTH: "true"
      HOST: localhost # change this to your public facing domain
      URL_SCHEME: http # change this to https when using it (highly recommended)
      DATABASE_SSL: 'false'
    # Ensures that the postgres service is started first.
    depends_on:
      - db
  db:
    image: postgres:10
    volumes:
      # Just preserve the postgresql data in the local folder.
      - magpie-db-volume:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: magpie
      POSTGRES_USER: magpie
      POSTGRES_DB: magpie

volumes:
  magpie-db-volume:
```

If you put this file in a folder and run `docker-compose up` you will have a running magpie-backend at localhost:4000.
