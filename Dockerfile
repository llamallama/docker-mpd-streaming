FROM alpine:latest
MAINTAINER Chris Jones "chris@sysengineerchris.com"
ARG UID=9001
ARG GID=9001

RUN apk add --no-cache sudo mpd shadow && rm -rf /var/cache/apk/*

ADD docker-entrypoint.sh /entrypoint.sh
ADD mpd.conf /etc/mpd.conf
RUN chmod 644 /etc/mpd.conf

RUN usermod -u ${UID} mpd
RUN groupmod -g ${GID} audio

VOLUME /mpd/cache
VOLUME /mpd/playlists

EXPOSE 8000 6600
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
