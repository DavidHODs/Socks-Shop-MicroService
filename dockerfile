FROM nginx:latest

LABEL version="0.0.1"
LABEL maintainer="davidoluwatobi41@gmail.com"

EXPOSE 80

WORKDIR /usr/share/nginx/html

RUN mkdir -p /usr/share/nginx/html/static

COPY static /usr/share/nginx/html/static

COPY index.html index.html