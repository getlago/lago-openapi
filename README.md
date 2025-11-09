# Lago OpenAPI1

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
