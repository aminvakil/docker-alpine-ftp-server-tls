# docker-alpine-ftp-server-tls
Small and flexible docker image with vsftpd server with tls

## Usage
```
docker run -d \
            -p 21:21 \
            -p 21000-21010:21000-21010 \
            -e USERS="one|1234" \
            -e ADDRESS=ftp.site.domain \
            quay.io/aminvakil/alpine-ftp-server-tls
```

## Configuration

Environment variables:
- `USERS` - space and `|` separated list (optional, default: `ftp|alpineftp`)
  - format `name1|password1|[folder1][|uid1] name2|password2|[folder2][|uid2]`
- `ADDRESS` - external address witch clients can connect passive ports (optional, should resolve to ftp server ip address)
- `MIN_PORT` - minimum port number to be used for passive connections (optional, default `21000`)
- `MAX_PORT` - maximum port number to be used for passive connections (optional, default `21010`)

## USERS examples

- `user|password foo|bar|/home/foo`
- `user|password|/home/user/dir|10000`
- `user|password||10000`

## ALERT
Do not use this certificate in your production server, you should generate your own certificate using this command
`openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -keyout vsftpd.pem -out vsftpd.pem`

The image gets big if we add openssl and generate certificate inside container, but it will be easy on host to generate a new certificate.
