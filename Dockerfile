FROM python:alpine
MAINTAINER kjake
RUN apk --no-cache add -f \
    wget \
    curl \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /app/speedtest/ \
    && wget https://raw.github.com/sivel/speedtest-cli/master/speedtest.py-O /app/speedtest/speedtest.py \
    && chmod +x /app/speedtest/speedtest.py \
    && adduser -S speedtest
USER speedtest
ADD scripts/ /app/speedtest/
CMD bash -c /app/speedtest/init_test_connection.sh