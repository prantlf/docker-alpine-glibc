FROM alpine:latest
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
	apk add --no-cache glibc-2.32-r0.apk && \
	rm glibc-2.32-r0.apk && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-bin-2.32-r0.apk && \
	apk add --no-cache glibc-bin-2.32-r0.apk && \
	rm glibc-bin-2.32-r0.apk && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-i18n-2.32-r0.apk && \
	apk add --no-cache glibc-i18n-2.32-r0.apk && \
	rm glibc-i18n-2.32-r0.apk /etc/apk/keys/sgerrand.rsa.pub && \
	/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
	apk del glibc-bin glibc-i18n
