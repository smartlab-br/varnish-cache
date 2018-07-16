FROM alpine:3.7
LABEL maintainer="smartlab-dev@mpt.mp.br"

COPY start.sh /start.sh
COPY varnish-cache.vcl /etc/varnish/varnish-cache.vcl

RUN apk --update --no-cache add varnish && \
    rm -rf /var/cache/apk/* && \
    rm -rf ~/.cache/ 

ENV VC_BACKEND_ADDR 127.0.0.1
ENV VC_BACKEND_PORT 7777
ENV VC_MEMORY       256M
ENV VC_GRACE        12h
ENV VC_TTL_CACHE    3600
ENV VC_TTL_BROWSER  3600

EXPOSE 80

ENTRYPOINT ["sh", "/start.sh"]
