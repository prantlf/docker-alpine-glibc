clean ::
	docker image rm alpine-glibc

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile

build ::
	docker build -t alpine-glibc .

run ::
	docker run --rm -t -i alpine-glibc

tag ::
	docker tag alpine-glibc prantlf/alpine-glibc:latest

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-glibc:latest
