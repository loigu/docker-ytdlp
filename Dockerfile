# Original credit: https://github.com/kylemanna/docker-openvpn

# Smallest base image
FROM alpine:edge

LABEL maintainer="Nanda Bhikkhu <nanda.bhikkhu@sasanarakkha.org>"

# Testing: pamtester
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update  screen bash yt-dlp
# py3-pip
#RUN python3 -m pip install -U "yt-dlp"

VOLUME ["/downloads"]


CMD ["/bin/bash"]

