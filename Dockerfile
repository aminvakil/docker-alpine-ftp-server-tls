FROM alpine:3.17.0

LABEL maintainer="Amin Vakil <info@aminvakil.com>"

RUN apk --no-cache add vsftpd=3.0.5-r2

COPY vsftpd.pem /etc/ssl/certs/vsftpd.pem
COPY start_vsftpd.sh /usr/local/bin/start_vsftpd.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

STOPSIGNAL SIGKILL

ENTRYPOINT ["/usr/local/bin/start_vsftpd.sh"]
