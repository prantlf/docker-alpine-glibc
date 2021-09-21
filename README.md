# prantlf/alpine-glibc

[Docker] image: Alpine Linux with GNU C Library (glibc) for compatibility

[![prantlf/alpine-glibc](http://dockeri.co/image/prantlf/alpine-glibc)](https://hub.docker.com/repository/docker/prantlf/alpine-glibc/)

[This image] is supposed to serve as a base for small images ([Alpine Linux]) which need to include tools built against [GNU C Library (glibc)]. This image is built automatically on the top of the tag `latest` from the [Alpine repository], so that it is always based on the latest [Alpine Linux]. The package [alpine-pkg-glibc] has to be updated from time to time by editing the Dockerfile and triggering a new build manually.

If you have trouble pulling the image from the Docker's default hub.docker.com, try gitlab.com, where [this project] is primarily maintained: `registry.gitlab.com/prantlf/docke-alpine-glibc`.

## Tags

- [`latest`], `3.14`, `3.13`, `3.12`

## Install

```
docker pull prantlf/alpine-glibc
docker pull prantlf/alpine-glibc:3.14
```

## Use

You can create your own image based on this one by referring to it from your `Dockerfile`:

```dockerfile
FROM prantlf/alpine-glibc:latest
```

The final image can use the English locale by setting the environment variable `LANG` to  `C.UTF-8` or `en_US.UTF-8`.

See the [`git-p4` Docker image repository] for an example.

## Build, Test and Publish

The local image is built as `alpine-glibc` and pushed to the docker hub as `prantlf/alpine-glibc:latest`.

    # Remove an old local image:
    make clean
    # Check the `Dockerfile`:
    make lint
    # Build a new local image:
    make build
    # Enter an interactive shell inside the created image:
    make run
    # Tag the local image for pushing:
    make tag
    # Login to the docker hub:
    make login
    # Push the local image to the docker hub:
    make push

## License

Copyright (c) 2020-2021 Ferdinand Prantl

Licensed under the MIT license.

[Docker]: https://www.docker.com/
[This image]: https://hub.docker.com/repository/docker/prantlf/alpine-glibc
[this project]: https://gitlab.com/prantlf/docker-alpine-glibc#prantlfalpine-glibc
[`latest`]: https://hub.docker.com/repository/docker/prantlf/alpine-glibc/tags
[GNU C Library (glibc)]: https://www.gnu.org/software/libc/
[alpine-pkg-glibc]: https://github.com/sgerrand/alpine-pkg-glibc#readme
[Alpine repository]: https://hub.docker.com/_/alpine
[Alpine Linux]: https://alpinelinux.org/
[`git-p4` Docker image repository]: https://github.com/prantlf/docker-git-p4#readme
