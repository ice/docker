# Ice Framework Docker image

A minimal `php-fpm` Alpine image with the [Ice framework](https://github.com/ice/framework)
C-extension (`ice`) pre-installed from [PECL](https://pecl.php.net/package/ice).

## Usage

```sh
docker run --rm ghcr.io/ice/framework:php8.5 php -m | grep ice
```

Or as a base image in your own `Dockerfile`:

```dockerfile
FROM ghcr.io/ice/framework:php8.5
```

## Build arguments

| Argument       | Default  | Description                          |
|----------------|----------|---------------------------------------|
| `PHP_VERSION`  | `8.5`    | Base `php:*-fpm-alpine` image tag     |
| `ICE_VERSION`  | `1.12.0` | Version of `ice` to install from PECL |

Build it yourself with a different combination, e.g. PHP 8.4 with an older Ice release:

```sh
docker build --build-arg PHP_VERSION=8.4 --build-arg ICE_VERSION=1.11.0 -t ice-framework .
```

## Published tags

Images are built and pushed to [GitHub Container Registry](https://ghcr.io) on every
tagged release, for each supported PHP version:

* `ghcr.io/ice/framework:php8.4`, `ghcr.io/ice/framework:php8.5` — always the latest published build for that PHP version
* `ghcr.io/ice/framework:<tag>-php8.4`, `ghcr.io/ice/framework:<tag>-php8.5` — pinned to a specific release tag

Every push and pull request also triggers a build-only CI check (no push) to catch breakage early.

## License

Ice is open-sourced software licensed under the New BSD License. See the
[LICENSE](https://www.iceframework.org/license) file for more information.

***
Copyright (c) 2014-2026 Ice Team.
