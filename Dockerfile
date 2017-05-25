FROM alpine:3.4

RUN apk --update add curl python py-setuptools py-pip && \
    pip install elasticsearch-curator==5.0.1 && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*

WORKDIR /home

COPY actions.yml .
COPY curator.yml .
COPY main.py .

CMD ["python", "main.py"]