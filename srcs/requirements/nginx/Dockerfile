FROM debian:buster

RUN apt-get update -y && apt-get -y install openssl nginx

# making a new ssl key
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/cert.pem \
    -keyout /etc/nginx/key.pem -subj "/C=/ST=/L=/O=/CN=${DOMAIN_NAME}"


COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]