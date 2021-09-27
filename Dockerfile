FROM alpine:3.14
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN apk --no-cache add gzip
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk
RUN	apk --no-cache add glibc-2.34-r0.apk
RUN	rm glibc-2.34-r0.apk
RUN	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-bin-2.34-r0.apk
RUN	apk --no-cache add glibc-bin-2.34-r0.apk
RUN	rm glibc-bin-2.34-r0.apk
RUN	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-i18n-2.34-r0.apk
RUN	apk --no-cache add glibc-i18n-2.34-r0.apk
RUN	rm glibc-i18n-2.34-r0.apk /etc/apk/keys/sgerrand.rsa.pub
RUN gunzip --keep /usr/glibc-compat/share/i18n/charmaps/UTF-8.gz
RUN	/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8
RUN rm /usr/glibc-compat/share/i18n/charmaps/UTF-8
RUN apk del glibc-bin glibc-i18n gzip
