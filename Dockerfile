FROM alpine:latest
MAINTAINER Stephane Albert "sheeprine@nullplace.com"

RUN apk add --no-cache mpd && rm -rf /var/cache/apk/*

RUN adduser -S mpd
RUN addgroup -S mpd
ADD docker-entrypoint.sh /entrypoint.sh
ADD mpd.conf /etc/mpd.conf
RUN chmod 644 /etc/mpd.conf

VOLUME /mpd/cache
VOLUME /mpd/playlists

EXPOSE 8000 6600
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
