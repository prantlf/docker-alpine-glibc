# prantlf/alpine-glibc

[Docker] image: Alpine Linux with GNU C Library (glibc) for compatibility

[![prantlf/alpine-glibc](http://dockeri.co/image/prantlf/alpine-glibc)](https://hub.docker.com/repository/docker/prantlf/alpine-glibc/)

[This image] is supposed to run JavaScript applications written for [Low.js], which supports a subset of [Node.js] API with much less footprint. For example, Node.js 14.3.0 needs 120 MB and Low.js 1.5.1 needs 6 MB on the disk. The price is a [limited API] and a JavaScript engine without JIT ([Duktape]). This image is built automatically on the top of the tag `latest` from the [Alpine repository], so that it is always based on the latest [Alpine Linux]. [Low.js] has to be updated from time to time by triggering a new build manually.

## Tags

- [`latest`]

## Install

```
docker pull prantlf/alpine-glibc
```

## Use

You can either create your own image based on this one, or you can use it directly to run a JavaScript project. The Low.js binary `/bin/low` is the default entrypoint. The directory `/root` is the default working directory. Ports 80 and 443 are exposed by default.

For example, run a script from `hello.js` in the current directory:

    docker run --rm -it -v "${PWD}":/root \
      prantlf/alpine-glibc hello.js

For example, start a web server using built-in networking modules from `server.js` in the current directory:

    docker run --rm -it -v "${PWD}":/root -p 80:80 -p 443:443 \
      prantlf/alpine-glibc server.js

## Build, Test and Publish

The local image is built as `alpine-glibc` and pushed to the docker hub as `prantlf/alpine-glibc:latest`.

Remove an old local image:

    make clean

Check the `Dockerfile`:

    make lint

Build a new local image:

    make build

Enter an interactive shell inside the created image:

    make run

Tag the local image for pushing:

    make tag

Login to the docker hub:

    make login

Push the local image to the docker hub:

    make push

## License

Copyright (c) 2020 Ferdinand Prantl

Licensed under the MIT license.

[Docker]: https://www.docker.com/
[This image]: https://hub.docker.com/repository/docker/prantlf/alpine-glibc
[`latest`]: https://hub.docker.com/repository/docker/prantlf/alpine-glibc/tags
[Low.js]: https://www.neonious.com/alpine-glibc/
[Node.js]: https://nodejs.org/
[limited API]: https://www.neonious.com/alpine-glibc/documentation/nodejs-api.html
[Duktape]: https://duktape.org/
[Alpine repository]: https://hub.docker.com/_/alpine
[Alpine Linux]: https://alpinelinux.org/
