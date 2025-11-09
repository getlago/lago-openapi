# Lago OpenAPI

Open API specification for Lago project

[![License: AGPLv3](https://img.shields.io/badge/license-AGPLv3-purple)](https://github.com/getlago/lago-openapi/blob/main/LICENSE)

## Current Releases

| Project          | Release Badge                                                                                                                             |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| **Lago**         | [![Lago Release](https://img.shields.io/github/v/release/getlago/lago)](https://github.com/getlago/lago/releases)                         |
| **Lago OpenAPI** | [![Lago OpenAPI Release](https://img.shields.io/github/v/release/getlago/lago-openapi)](https://github.com/getlago/lago-openapi/releases) |

## Usage

This repository is used to serve http://swagger.getlago.com/

## Documentation

The Lago documentation is available at [doc.getlago.com](https://doc.getlago.com/docs/api/intro).

## Contributing

The contribution documentation is available [here](https://github.com/getlago/lago-openapi/blob/main/CONTRIBUTING.md)

## License

Lago is distributed under the [AGPLv3](LICENSE) License.

Read more [here](https://www.getlago.com/blog/open-source-licensing-and-why-lago-chose-agplv3).

## Local development

### Install dependencies

```
npm install
```

You may also need Docker to run some commands.

### Run with Docker

You can ship the bundled API documentation with the production-ready image in this repo:

```sh
docker build -t lago-openapi .
docker run --rm -p 8080:80 lago-openapi
```

For local work with hot reloading, use the development Dockerfile which runs `npm run preview:redocly`:

```sh
docker build -f Dockerfile.dev -t lago-openapi-dev .
docker run --rm -it -p 8080:8080 \
  -v "$(pwd)":/app \
  -v lago-openapi-node_modules:/app/node_modules \
  lago-openapi-dev
```

Mounting the repository keeps file changes in sync with the container, while the named volume preserves installed dependencies between runs.

### Build openapi.yaml

```
npm run build
```

### Lint

```
npm run test
```

### Preview using Redoc

To preview the OpenAPI specification using Redoc, you can use the following command:

```sh
npm run preview:redocly
```

This will watch for changes in the OpenAPI specification files and automatically rebuild and reload them.

The Redoc documentation will be available at `http://localhost:8080/`.

### Preview using Swagger UI

To preview the OpenAPI specification using Swagger UI, as on <https://swagger.getlago.com>, you can use the following command:

```sh
npm run preview:swagger
```

The Swagger UI will be available at `http://localhost:8080/`.
