FROM alpine:3.7

RUN set -ex \
 && apk --no-cache add \
      bash \
      build-base \
      curl \
      ffmpeg \
      libffi-dev \
      openssl-dev \
      py2-pip \
      python-dev \
 && pip install \
      "streamlink==0.14.2" \
 && curl -sSfLo /usr/local/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64" \
 && chmod +x /usr/local/bin/dumb-init \
 && apk --no-cache del \
      build-base \
      curl \
      python-dev

COPY wrap.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/wrap.sh"]
