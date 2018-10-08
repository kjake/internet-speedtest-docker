FROM python:alpine
MAINTAINER kjake
RUN apk --no-cache add -f curl \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /app/speedtest/ \
    && curl -o /app/speedtest/speedtest.py https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py \
    && chmod +x /app/speedtest/speedtest.py \
    && adduser -S speedtest
USER speedtest
ADD scripts/ /app/speedtest/
CMD /app/speedtest/init_test_connection.sh