FROM nginx:latest

FROM node:slim

LABEL version="0.0.1"
LABEL maintainer="davidoluwatobi41@gmail.com"

WORKDIR /usr/share/nginx/html

COPY /static .

COPY index.html index.html