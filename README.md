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

The specifications are published separately:

- `openapi.yaml`: API v1. Its URL remains unchanged for existing consumers.
- `openapi-v2.yaml`: API v2 (beta). It currently documents taxes, the product catalog, contracts and billing. Other native v2 endpoints will be added separately.

Swagger UI has a version selector and opens API v1 by default. The v2 specification only lists endpoints that have been checked against their v2 implementation. Do not assume that every v1 endpoint is available in v2 or has the same response format.

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

### Build the specifications

```
npm run build
```

`redocly.yaml` maps each source document to its generated bundle:

| Version | Source | Bundle |
| --- | --- | --- |
| v1 | `src/openapi.yaml` | `openapi.yaml` |
| v2 | `src/v2/openapi.yaml` | `openapi-v2.yaml` |

Use `npm run build:v1` or `npm run build:v2` to build one version. Do not edit the bundles by hand.

### Lint

```
npm run test
```

This builds and lints both versions. V2 examples are also checked against their schemas. CI checks both specifications and verifies that the committed bundles match a fresh build.

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

Use the selector at the top of the page to switch between v1 and v2.
