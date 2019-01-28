FROM quay.io/spivegin/afzas

# Only need ca-certificates & openssl if want to use DNS over TLS (RFC 7858).
RUN mkdir -p /opt/bin 
WORKDIR /opt/dns

ADD bin /opt/bin
ADD certs /opt/dns/certs
ADD bash/main.sh /opt/bin/main.sh
ADD CoreFiles/Corefile /opt/dns/Corefile
ADD https://zinc.tpnfc.us/TLM.crt /etc/ssl/certs/

ENV ADSERVER_TEST=false \
    NATS_ADDRESS=tls://nats.example.com \
    NATS_PORT=443 \
    COCKROACH_ADDRESS=crdb.example.com \
    COCKROACH_PORT=26257 \
    COCKROACH_DATABASE=coredns \
    COCKROACH_USER=username \
    ONEPASS=kxFpeiovjqagrAfCc9zhdn7b3mwEyHt4su \
    NATSD_HOST=nats.example.com \
    FE4Hs7uAehidCqpn93az=qE9FpxyA3hsudjH4fica


RUN update-ca-certificates &&\
    chmod +x /opt/bin/coredns /opt/bin/adfree /opt/bin/ads /opt/bin/main.sh &&\
    ln -s /opt/bin/coredns /bin/coredns &&\
    ln -s /opt/bin/adfree /bin/adfree &&\
    ln -s /opt/bin/ads /bin/ads &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE 53 53/udp
CMD ["/opt/bin/main.sh"]