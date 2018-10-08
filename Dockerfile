FROM python:alpine
MAINTAINER kjake
RUN apk --no-cache add -f curl \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /app/speedtest/ \
    && curl -o /app/speedtest/speedtest.py https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py \
    && chmod +x /app/speedtest/speedtest.py \
    && adduser -S speedtest
ADD scripts/ /app/speedtest/
RUN chown -R speedtest /app/speedtest
USER speedtest
CMD /app/speedtest/init_test_connection.sh