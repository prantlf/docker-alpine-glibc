clean ::
	docker image rm alpine-glibc:3.13

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t alpine-glibc:3.13 .

run ::
	docker run --rm -t -i alpine-glibc:3.13

tag ::
	docker tag alpine-glibc:3.13 prantlf/alpine-glibc:3.13

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-glibc:3.13
