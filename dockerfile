FROM golang:alpine as builder
RUN mkdir -p /go/src/github.com/DavidHODs/Docker-Resume
COPY app/ /go/src/github.com/DavidHODs/Docker-Resume
WORKDIR /go/src/github.com/DavidHODs/Docker-Resume
RUN go build /go/src/github.com/DavidHODs/Docker-Resume/main.go

ARG hostname  
ARG port
ARG user
ARG password
ARG dbname

LABEL version="latest"
LABEL author="David Oluwatobi"
LABEL maintainer="davidoluwatobi41@gmail.com"

FROM alpine
RUN apk add --no-cache ca-certificates && update-ca-certificates
COPY --from=builder /go/src/github.com/DavidHODs/Docker-Resume/ /
EXPOSE 8000 
ENTRYPOINT ["/main"]