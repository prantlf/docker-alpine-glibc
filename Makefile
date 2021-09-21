clean ::
	docker image rm alpine-glibc:3.14

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile

build ::
	docker build -t alpine-glibc:3.14 .

run ::
	docker run --rm -t -i alpine-glibc:3.14

tag ::
	docker tag alpine-glibc:3.14 prantlf/alpine-glibc:3.14

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-glibc:3.14
