FROM golang:alpine as builder
RUN mkdir -p /go/src/github.com/DavidHODs/Docker-Resume
COPY app/ /go/src/github.com/DavidHODs/Docker-Resume
COPY app/docker.env /go/src/github.com/DavidHODs/Docker-Resume
WORKDIR /go/src/github.com/DavidHODs/Docker-Resume
RUN go build /go/src/github.com/DavidHODs/Docker-Resume/main.go

ARG host     
ARG port    
ARG user     
ARG password
ARG dbname   

LABEL version="latest"
LABEL maintainer="davidoluwatobi41@gmail.com"

FROM alpine
RUN apk add --no-cache ca-certificates && update-ca-certificates
COPY --from=builder /go/src/github.com/DavidHODs/Docker-Resume/ /usr/bin/github.com/DavidHODs
EXPOSE 8000 
ENTRYPOINT ["/usr/bin/github.com/DavidHODs/main"]