FROM alpine

RUN set -ex \
 && apk --no-cache add build-base ffmpeg py2-pip curl bash \
 && pip install streamlink \
 && curl -sSfLo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 \
 && chmod +x /usr/local/bin/dumb-init \
 && apk --no-cache del build-base curl

ADD wrap.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/wrap.sh"]
