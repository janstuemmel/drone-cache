FROM alpine:3.4
MAINTAINER Jan Stümmel <info@janstuemmel.de>

COPY cache.sh /usr/local/cache
RUN mkdir /cache && apk add --no-cache bash && chmod 755 /usr/local/cache
VOLUME /cache

ENTRYPOINT ["/usr/local/cache"]
