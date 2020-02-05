FROM alpine:3.13
FROM alpine:3.11

LABEL maintainer="Amin Vakil <info@aminvakil.com>"

RUN apk --no-cache add vsftpd

COPY vsftpd.pem /etc/ssl/certs/vsftpd.pem
COPY start_vsftpd.sh /usr/local/bin/start_vsftpd.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

ENTRYPOINT ["/usr/local/bin/start_vsftpd.sh"]
