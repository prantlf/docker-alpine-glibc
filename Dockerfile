FROM alpine:3.14
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

ENV I18NPATH=/usr/glibc-compat/share/i18n

RUN apk --no-cache add gzip && \
  wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk && \
	apk add --no-cache glibc-2.34-r0.apk && \
	rm glibc-2.34-r0.apk && \
	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-bin-2.34-r0.apk && \
	apk add --no-cache glibc-bin-2.34-r0.apk && \
	rm glibc-bin-2.34-r0.apk && \
	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-i18n-2.34-r0.apk && \
	apk add --no-cache glibc-i18n-2.34-r0.apk && \
	rm glibc-i18n-2.34-r0.apk /etc/apk/keys/sgerrand.rsa.pub && \
  gunzip --keep /usr/glibc-compat/share/i18n/charmaps/UTF-8.gz
RUN ls -l /usr/glibc-compat/share/i18n/locales/en_US
RUN ls -l /usr/glibc-compat/share/i18n/charmaps/UTF-8.gz
RUN ls -l /usr/glibc-compat/share/i18n/charmaps/UTF-8
RUN	/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8
#	apk del glibc-bin glibc-i18n gzip
