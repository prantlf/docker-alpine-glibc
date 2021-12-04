clean ::
	docker image rm alpine-glibc:3.15

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile-bin

build ::
	docker build -t alpine-glibc:3.15 .
	docker build -t alpine-glibc:3.15-bin -f Dockerfile-bin .

run ::
	docker run --rm -t -i alpine-glibc:3.15

tag ::
	docker tag alpine-glibc:3.15 prantlf/alpine-glibc:3.15
	docker tag alpine-glibc:3.15-bin prantlf/alpine-glibc:3.15-bin

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-glibc:3.15
	docker push prantlf/alpine-glibc:3.15-bin
