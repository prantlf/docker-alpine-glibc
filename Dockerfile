FROM alpine:3.15
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN apk update && apk --no-cache add gzip && \
  wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
  wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk && \
  apk --no-cache add glibc-2.34-r0.apk && \
  ln -sf /usr/glibc-compat/lib/ld-linux-x86-64.so.2 /usr/glibc-compat/lib/ld-linux-x86-64.so && \
  ln -sf /usr/glibc-compat/lib/libBrokenLocale.so.1 /usr/glibc-compat/lib/libBrokenLocale.so && \
  ln -sf /usr/glibc-compat/lib/libanl.so.1 /usr/glibc-compat/lib/libanl.so && \
  ln -sf /usr/glibc-compat/lib/libc_malloc_debug.so.0 /usr/glibc-compat/lib/libc_malloc_debug.so && \
  ln -sf /usr/glibc-compat/lib/libcrypt.so.1 /usr/glibc-compat/lib/libcrypt.so && \
  ln -sf /usr/glibc-compat/lib/libdl.so.2 /usr/glibc-compat/lib/libdl.so && \
  ln -sf /usr/glibc-compat/lib/libmvec.so.1 /usr/glibc-compat/lib/libmvec.so && \
  ln -sf /usr/glibc-compat/lib/libnsl.so.1 /usr/glibc-compat/lib/libnsl.so && \
  ln -sf /usr/glibc-compat/lib/libnss_compat.so.2 /usr/glibc-compat/lib/libnss_compat.so && \
  ln -sf /usr/glibc-compat/lib/libnss_db.so.2 /usr/glibc-compat/lib/libnss_db.so && \
  ln -sf /usr/glibc-compat/lib/libnss_dns.so.2 /usr/glibc-compat/lib/libnss_dns.so && \
  ln -sf /usr/glibc-compat/lib/libnss_files.so.2 /usr/glibc-compat/lib/libnss_files.so && \
  ln -sf /usr/glibc-compat/lib/libnss_hesiod.so.2 /usr/glibc-compat/lib/libnss_hesiod.so && \
  ln -sf /usr/glibc-compat/lib/libpthread.so.0 /usr/glibc-compat/lib/libpthread.so && \
  ln -sf /usr/glibc-compat/lib/libresolv.so.2 /usr/glibc-compat/lib/libresolv.so && \
  ln -sf /usr/glibc-compat/lib/librt.so.1 /usr/glibc-compat/lib/librt.so && \
  ln -sf /usr/glibc-compat/lib/libthread_db.so.1 /usr/glibc-compat/lib/libthread_db.so && \
  ln -sf /usr/glibc-compat/lib/libutil.so.1 /usr/glibc-compat/lib/libutil.so && \
  rm glibc-2.34-r0.apk && \
  wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-bin-2.34-r0.apk && \
  apk --no-cache add glibc-bin-2.34-r0.apk && \
  rm glibc-bin-2.34-r0.apk && \
  wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-i18n-2.34-r0.apk && \
  apk --no-cache add glibc-i18n-2.34-r0.apk && \
  rm glibc-i18n-2.34-r0.apk /etc/apk/keys/sgerrand.rsa.pub && \
  gunzip --keep /usr/glibc-compat/share/i18n/charmaps/UTF-8.gz && \
  /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
  rm /usr/glibc-compat/share/i18n/charmaps/UTF-8 && \
  apk del glibc-bin glibc-i18n gzip
