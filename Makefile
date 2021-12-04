clean ::
	docker image rm alpine-glibc

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile-bin

build ::
	docker build -t alpine-glibc .
	docker build -t alpine-glibc:bin -f Dockerfile-bin .

run ::
	docker run --rm -t -i alpine-glibc

tag ::
	docker tag alpine-glibc prantlf/alpine-glibc
	docker tag alpine-glibc:bin prantlf/alpine-glibc:bin

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-glibc
	docker push prantlf/alpine-glibc:bin
