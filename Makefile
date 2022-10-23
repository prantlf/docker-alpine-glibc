clean ::
	docker image rm alpine-glibc alpine-glibc:bin prantlf/alpine-glibc prantlf/alpine-glibc:bin

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile-bin

build ::
	docker build -t alpine-glibc .
	docker tag alpine-glibc prantlf/alpine-glibc
	docker build -t alpine-glibc:bin -f Dockerfile-bin .
	docker tag alpine-glibc:bin prantlf/alpine-glibc:bin

run ::
	docker run --rm -t -i alpine-glibc

login ::
	docker login --username=prantlf
	docker login registry.gitlab.com --username=prantlf

push ::
	docker push prantlf/alpine-glibc
	docker push prantlf/alpine-glibc:bin
	docker push registry.gitlab.com/prantlf/docker-alpine-glibc
	docker push registry.gitlab.com/prantlf/docker-alpine-glibc:bin


pull ::
	docker pull prantlf/alpine-glibc
	docker pull prantlf/alpine-glibc:bin
	docker pull registry.gitlab.com/prantlf/docker-alpine-glibc
	docker pull registry.gitlab.com/prantlf/docker-alpine-glibc:bin

tag ::
	docker tag prantlf/alpine-glibc prantlf/alpine-glibc:3.16
	docker tag prantlf/alpine-glibc prantlf/alpine-glibc:3.16-2.35
	docker tag prantlf/alpine-glibc:bin prantlf/alpine-glibc:3.16-bin
	docker tag prantlf/alpine-glibc:bin prantlf/alpine-glibc:3.16-2.35-bin
	docker push prantlf/alpine-glibc:3.16
	docker push prantlf/alpine-glibc:3.16-2.35
	docker push prantlf/alpine-glibc:3.16-bin
	docker push prantlf/alpine-glibc:3.16-2.35-bin
	docker tag registry.gitlab.com/prantlf/docker-alpine-glibc registry.gitlab.com/prantlf/docker-alpine-glibc:3.16
	docker tag registry.gitlab.com/prantlf/docker-alpine-glibc registry.gitlab.com/prantlf/docker-alpine-glibc:3.16-2.35
	docker tag registry.gitlab.com/prantlf/docker-alpine-glibc:bin registry.gitlab.com/prantlf/docker-alpine-glibc:3.16-bin
	docker tag registry.gitlab.com/prantlf/docker-alpine-glibc:bin registry.gitlab.com/prantlf/docker-alpine-glibc:3.16-2.35-bin
	docker push registry.gitlab.com/prantlf/docker-alpine-glibc:3.16
	docker push registry.gitlab.com/prantlf/docker-alpine-glibc:3.16-2.35
	docker push registry.gitlab.com/prantlf/docker-alpine-glibc:3.16-bin
	docker push registry.gitlab.com/prantlf/docker-alpine-glibc:3.16-2.35-bin
