# syntax=docker/dockerfile:1

##
## Production build - bundles the OpenAPI spec and serves it through nginx
##
FROM node:20-bullseye AS builder
WORKDIR /app

# Install only what we need for building the spec
COPY package*.json ./
RUN npm ci

# Copy the rest of the sources and produce the bundled openapi.yaml
COPY . .
RUN npm run build

# Collect only the static assets we need for the final image
RUN mkdir -p /static-site \
 && cp -r dist /static-site/dist \
 && cp index.html /static-site/index.html \
 && cp openapi.yaml /static-site/openapi.yaml

FROM nginx:1.27-alpine AS runtime
WORKDIR /usr/share/nginx/html
COPY --from=builder /static-site ./

EXPOSE 80
HEALTHCHECK CMD wget -qO- http://localhost/ >/dev/null 2>&1 || exit 1
