FROM debian:buster

RUN apt-get update -y && apt-get -y install openssl nginx

RUN mkdir -p /var/ssl

# making a new ssl key
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /var/ssl/cert.pem \
    -keyout /var/ssl/key.pem -subj "/C=/ST=/L=/O=/CN=${DOMAIN_NAME}"

RUN rm -f /etc/nginx/sites-enabled/* && rm -f /etc/nginx/sites-available/*

COPY nginx.conf /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]