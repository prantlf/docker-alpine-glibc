FROM alpine:3.14
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN apk -v --no-cache add wget
RUN wget -v -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN	wget -v https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk
RUN	apk -v --no-cache add glibc-2.34-r0.apk
RUN	rm glibc-2.34-r0.apk
RUN	wget -v https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-bin-2.34-r0.apk
RUN	apk -v --no-cache add glibc-bin-2.34-r0.apk
RUN	rm glibc-bin-2.34-r0.apk
RUN	wget -v https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-i18n-2.34-r0.apk
RUN	apk -v --no-cache add glibc-i18n-2.34-r0.apk
RUN	rm glibc-i18n-2.34-r0.apk /etc/apk/keys/sgerrand.rsa.pub
RUN	/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8
RUN apk del glibc-bin glibc-i18n wget
