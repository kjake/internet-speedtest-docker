FROM cgr.dev/chainguard/wolfi-base:latest
LABEL maintainer="kjake"
# Packages are intentionally unpinned so each rebuild picks up the latest
# CVE fixes from Wolfi; python-3 tracks the current default Python 3 release.
RUN apk add --no-cache python-3 curl \
    && mkdir -p /app/speedtest/ \
    && curl -o /app/speedtest/speedtest.py https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py \
    && chmod +x /app/speedtest/speedtest.py \
    && adduser -S speedtest
ADD scripts/ /app/speedtest/
RUN chown -R speedtest /app/speedtest
USER speedtest
CMD /app/speedtest/init_test_connection.sh
