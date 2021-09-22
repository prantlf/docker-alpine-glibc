FROM alpine:latest
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk && \
	apk add --no-cache glibc-2.33-r0.apk && \
  ln -sf /usr/glibc-compat/lib/ld-linux-x86-64.so.2 /usr/glibc-compat/lib/ld-linux-x86-64.so && \
  ln -sf /usr/glibc-compat/lib/ld-linux-x86-64.so.2 /usr/glibc-compat/lib/ld-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libBrokenLocale.so.1 /usr/glibc-compat/lib/libBrokenLocale.so && \
  ln -sf /usr/glibc-compat/lib/libBrokenLocale.so.1 /usr/glibc-compat/lib/libBrokenLocale-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libanl.so.1 /usr/glibc-compat/lib/libanl.so && \
  ln -sf /usr/glibc-compat/lib/libanl.so.1 /usr/glibc-compat/lib/libanl-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libc.so.6 /usr/glibc-compat/lib/libc-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libcrypt.so.1 /usr/glibc-compat/lib/libcrypt.so && \
  ln -sf /usr/glibc-compat/lib/libcrypt.so.1 /usr/glibc-compat/lib/libcrypt-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libdl.so.2 /usr/glibc-compat/lib/libdl.so && \
  ln -sf /usr/glibc-compat/lib/libdl.so.2 /usr/glibc-compat/lib/libdl-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libm.so.6 /usr/glibc-compat/lib/libm-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libmvec.so.1 /usr/glibc-compat/lib/libmvec.so && \
  ln -sf /usr/glibc-compat/lib/libmvec.so.1 /usr/glibc-compat/lib/libmvec-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libnsl.so.1 /usr/glibc-compat/lib/libnsl.so && \
  ln -sf /usr/glibc-compat/lib/libnsl.so.1 /usr/glibc-compat/lib/libnsl-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libnss_compat.so.2 /usr/glibc-compat/lib/libnss_compat.so && \
  ln -sf /usr/glibc-compat/lib/libnss_compat.so.2 /usr/glibc-compat/lib/libnss_compat-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libnss_db.so.2 /usr/glibc-compat/lib/libnss_db.so && \
  ln -sf /usr/glibc-compat/lib/libnss_db.so.2 /usr/glibc-compat/lib/libnss_db-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libnss_dns.so.2 /usr/glibc-compat/lib/libnss_dns.so && \
  ln -sf /usr/glibc-compat/lib/libnss_dns.so.2 /usr/glibc-compat/lib/libnss_dns-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libnss_files.so.2 /usr/glibc-compat/lib/libnss_files.so && \
  ln -sf /usr/glibc-compat/lib/libnss_files.so.2 /usr/glibc-compat/lib/libnss_files-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libnss_hesiod.so.2 /usr/glibc-compat/lib/libnss_hesiod.so && \
  ln -sf /usr/glibc-compat/lib/libnss_hesiod.so.2 /usr/glibc-compat/lib/libnss_hesiod-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libpthread.so.0 /usr/glibc-compat/lib/libpthread.so && \
  ln -sf /usr/glibc-compat/lib/libpthread.so.0 /usr/glibc-compat/lib/libpthread-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libresolv.so.2 /usr/glibc-compat/lib/libresolv.so && \
  ln -sf /usr/glibc-compat/lib/libresolv.so.2 /usr/glibc-compat/lib/libresolv-2.33.so && \
  ln -sf /usr/glibc-compat/lib/librt.so.1 /usr/glibc-compat/lib/librt.so && \
  ln -sf /usr/glibc-compat/lib/librt.so.1 /usr/glibc-compat/lib/librt-2.33.so && \
  ln -sf /usr/glibc-compat/lib/libthread_db.so.1 /usr/glibc-compat/lib/libthread_db.so && \
  ln -sf /usr/glibc-compat/lib/libthread_db.so.1 /usr/glibc-compat/lib/libthread_db-1.0.so && \
  ln -sf /usr/glibc-compat/lib/libutil.so.1 /usr/glibc-compat/lib/libutil.so && \
  ln -sf /usr/glibc-compat/lib/libutil.so.1 /usr/glibc-compat/lib/libutil-2.33.so && \
	rm glibc-2.33-r0.apk && \
	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-bin-2.33-r0.apk && \
	apk add --no-cache glibc-bin-2.33-r0.apk && \
	rm glibc-bin-2.33-r0.apk && \
	wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-i18n-2.33-r0.apk && \
	apk add --no-cache glibc-i18n-2.33-r0.apk && \
	rm glibc-i18n-2.33-r0.apk /etc/apk/keys/sgerrand.rsa.pub && \
	/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
	apk del glibc-bin glibc-i18n
