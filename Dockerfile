FROM grafana/grafana:5.0.4
MAINTAINER kjake

ADD conf/grafana.db /var/lib/grafana/grafana.db
ADD conf/home.json /usr/share/grafana/public/dashboards/home.json

ENV GF_SERVER_ROOT_URL http://localhost
ENV GF_SECURITY_ADMIN_PASSWORD admin
ENV GF_AUTH_ANONYMOUS_ENABLED true
ENTRYPOINT ["/run.sh"]
