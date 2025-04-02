# Original credit: https://github.com/kylemanna/docker-openvpn

# Smallest base image
FROM alpine:edge

LABEL maintainer="Nanda Bhikkhu <nanda.bhikkhu@sasanarakkha.org>"

# Testing: pamtester
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update  screen bash yt-dlp vim coreutils file fontconfig

RUN mkdir -p /usr/share && \
  cd /usr/share \
  && wget -O - https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj \
  && ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs \
  && phantomjs --version

# py3-pip
#RUN python3 -m pip install -U "yt-dlp"
ADD ./bin/* /bin/
RUN chmod 777 /bin/*

VOLUME ["/downloads"]
VOLUME ["/termuxAndroidHelpers"]
RUN echo 'nanda:x:1018:100::/downloads:/bin/bash' >>/etc/passwd
USER 1018:100
# /downloads

CMD ["/bin/start.sh"]

