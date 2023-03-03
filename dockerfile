FROM nginx:latest

LABEL version="0.0.1"
LABEL maintainer="davidoluwatobi41@gmail.com"

EXPOSE 80

WORKDIR /usr/share/nginx/html

COPY /static .

COPY index.html index.html